from email.mime.text import MIMEText
from subprocess import Popen, PIPE

msg = MIMEText("Here is the body of my message")
msg["From"] = "nowhere@localhost.com"
msg["To"] = "wsaryoo@gmail.com"
msg["Subject"] = "This is the subject."
p = Popen(["/usr/sbin/sendmail", "-t", "-oi"], stdin=PIPE)
p.communicate(msg.as_bytes())


# import smtplib
# 
# server = smtplib.SMTP("localhost")
# server.sendmail('wsaryoo@gmail.com'
# """To: wsaryoo@gmail.com
# From: nowhere@localhost.com
# 
# Hello from no where.
# """)
# 
# server.quit()

