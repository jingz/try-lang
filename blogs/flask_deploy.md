#### Deploy Flask Application


01. Create Deploy User

```bash
$ useradd deploy
$ mkdir /home/deploy
$ chown deploy:deploy /home/deploy
$ usermod -a -G sudo deploy
$ passwd deploy
$ chsh -s /bin/bash deploy

$ su deploy
```

02. Update Ubuntu (18.04) Packages

```bash
$ apt update
$ apt upgrade
```

03. Install Python3.7 on Ubuntu 18.04

```bash
$ sudo apt install software-properties-common
$ sudo add-apt-repository ppa:deadsnakes/ppa
Press [ENTER] to continue or Ctrl-c to cancel adding it.

$ sudo apt install python3.7
$ sudo apt install python3-pip  # pip3
$ sudo apt install ufw virtualenv git nginx supervisor
```

04. Clone Project and Create virutalenv

```bash
$ git clone project
$ cd ./project
$ virutalenv venv --python python3.7
$ source venv/bin/activate
```

05. Installing Database (Postgresql 10)

```bash
sudo apt install postgresql postgresql-contrib

# checking
sudo -u postgres psql -c "SELECT version();"
```

06. Creating PostgreSQL Role and Database with Granted all privileges

```bash
sudo su - postgres -c "createuser john"
sudo su - postgres -c "createdb johndb"

# enter to postgresql
sudo -u postgres psql
grant all privileges on database johndb to john;
ALTER USER john WITH PASSWORD 'new_password';
```

07. Create Flask Config File and Run DB Initialization

```bash
$ cd project/config
$ cp production_sample.py production.py
$ vim production.py  # change DB_URI to postgresql://dbuser:pass@localhost:5432/dbprod
$ cd .. && python manage.py db upgrade
```

08. Config Nginx

```bash
$ sudo rm /etc/nginx/sites-enabled/default
$ sudo vim /etc/nginx/sites-available/project
```

```text
# nginx config
server {
    listen 80;
    server_name yourdomain or ip;

    root /home/deploy/project;

    access_log /home/deploy/project/logs/nginx/access.log;
    error_log /home/deploy/project/logs/nginx/error.log;

    location / {
        proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        if (!-f $request_filename) {
            proxy_pass http://127.0.0.1:8000;
            break;
        }
    }

    location /static {
        alias  /home/deploy/project/application/static/;
        autoindex on;
    }
}
```


```bash
$ mkdir -p ~/project/logs/nginx

$ sudo ln -s /etc/nginx/sites-available/project /etc/nginx/sites-enabled/
$ sudo nginx -t  # test nginx syntax
$ sudo service nginx restart
```

09. Ensure to install Gunicorn and Gevent

```bash
pip install gunicorn gevent
```

10. Supervisord

```bash
sudo vim /etc/supervisor/conf.d/project.conf
```

```text
[program:project]
command = /home/deploy/project/venv/bin/gunicorn wsgi:app -w 5 -k gevent
directory = /home/deploy/project
user = deploy
stdout_logfile = /home/deploy/project/logs/gunicorn/gunicorn_stdout.log
stderr_logfile = /home/deploy/project/logs/gunicorn/gunicorn_stderr.log
redirect_stderr = True
environment = MODE=PRODUCTION
```

```bash
$ sudo supervisorctl reread
$ sudo supervisorctl update
$ sudo supervisorctl start project
```

11. Nginx Log Rotation

```bash
sudo vim /etc/logrotate.d/nginx
```

```text
/var/log/nginx/*.log /home/deploy/project/logs/nginx/*.log {
  ...
}
```

12. Install Certbot for HTTPS

```bash
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository universe
$ sudo add-apt-repository ppa:certbot/certbot
$ sudo apt-get update
$ sudo apt-get install certbot python-certbot-nginx

$ sudo certbot --nginx
```


13. Setup Social Auth (Google , FB) (Flask-Dance)

setup valid redirect url and update appid and app-secret

```text
# valid google redirect uri
https://project.com/google_login/google/authorized

# valid facebook redirect uri
https://project.com/fb_login/facebook/authorized
```

```
proxy_set_header X-Forwarded-Proto $scheme;
```

```text
# in nginx config do not for get to add in reverse proxy block

proxy_set_header X-Forwarded-Proto $scheme;
```
