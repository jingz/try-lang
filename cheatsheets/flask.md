Flask Cheatsheet
----------------
  high-level api able to import directly from flask `from flask import ...`

  flask dependents on: werkzeug(routing, request, response),
                       jinja2(templating), 
                       blinker(signaling)

------------------------------------------------------------------------
abort(status) -> werkzeug.exceptions
    Raise an exception by the error code or WSGI application.
    [more][http://werkzeug.pocoo.org/docs/0.11/exceptions/#simple-aborting]

redirect(location, code=302, Response=None) -> werkzeug.utils
    Return a response object 
    [more][http://werkzeug.pocoo.org/docs/0.11/utils/]

Markup([String]) -> jinja2
    Marks a string as being safe for inclusion in HTML/XML output without needing to be escaped 
    ### example
    ```python
    >>> Markup("Hello <em>World</em>!")
    Markup(u'Hello <em>World</em>!')
    >>> class Foo(object):
    ...  def __html__(self):
    ...   return '<a href="#">foo</a>'
    ...
    >>> Markup(Foo())
    Markup(u'<a href="#">foo</a>')
    ```
    [more][http://jinja.pocoo.org/docs/dev/api/#jinja2.Markup]

escape(string) -> jinja2
    Convert the characters &, <, >, ', and " in string to HTML-safe sequences 
    [more][http://jinja.pocoo.org/docs/dev/templates/#escape]

Flask(import_name, static_path=None, 
      static_url_path=None, static_folder='static', 
      template_folder='templates', instance_path=None,
      instance_relative_config=False, root_path=None) -> .app
    The flask object implements a WSGI application
    ```python
    app = Flask(__name__)
    ```

Request(environ, populate_request=True, shallow=False) -> .app -> .warppers -> werkzeug.wrappers
    Full featured request object implementing the following mixins
    [more][http://werkzeug.pocoo.org/docs/0.11/wrappers/#werkzeug.wrappers.Request]

Response(reponse=None, status=None, headers=None, mimetype=None, content_type=None, direct_passthrough=False) -> .app -> .wrappers -> werkzug.wrappers
    Full featured response object implementing the following mixins
    [more][http://werkzeug.pocoo.org/docs/0.11/wrappers/#werkzeug.wrappers.Response]

Config(root_path, defaults=None) -> .config

url_for(endpoint, **values) -> .helpers
    Generate a URL to the given endpoint with the method provided
    ```python
        # this will reference the index function local to the current blueprint
        url_for(".index")
    ```
    
flash(message, category='message') -> .helpers
    Flashes a message to the next request
    to display it to the user, the template has to call `get_flashed_messages`
    @message = string message
    @category could be `message`, `error`, `info`, `warning`

send_file(filename_or_fp, mimetype=None, as_attachment=False, attachment_filename=None, add_etags=True, cache_timeout=None, conditional=False) -> .helpers
    ` It is strongly recommended to activate either X-Sendfile support in your webserver `

send_from_directory(directory, filename, **options) -> .helpers
    ```python
    @app.route("/uploads/<path:filename>")
    def download_file(filename):
        return send_from_directory(app.config["UPLOAD_FOLDER"], 
                                   filename, as_attachment=True)
    ```
get_flashed_messages(with_categories=False, category_filter=[])
    Pulls all flashed messages
    return (category, message)

get_template_attribute(template_name, attribute) -> .helpers
    Loads a macro (or variable) a template exports
    ```python
    # _cider.html
    {% macro hello(name) %}Hello {{ name }}!{% endmacro %}
    # access from python
    hello = get_template_attribute('_cider.html', 'hello')
    return hello('World')
    ```
make_response(rv) -> .helpers
    rv is
    - Response Class 
    - string as body
    - unicode string as body
    - a WSGI function
    - tuple (response, status, headers) or (response, headers )
    
safe_join(directory, *pathnames) -> .helpers
    safely join directory and filename.

stream_with_context(generator_or_function) -> .helpers
    ```python
    @app.route('/stream')
    def streamed_response():
        @stream_with_context
        def generate():
            yield 'Hello '
            yield request.args['name']
            yield '!'
        return Response(generate())
    ```

current_app -> .globals -> werkzeug.local.LocalProxy

g -> .globals
    Just store on this whatever you want.
    ex. database connection or the user that is currently logged in.
    ```python
    user = getattr(flask.g, 'user', None)
    user = flask.g.get('user', None)
    ```

request -> .globals
    Incoming request data

session -> .globals
    Ordinary dict that keeps track on modifications
    attributes
    new = True if the session is new, otherwise False
    modified = True if sessoin object detected a moddification
    permanent = True the session lives for permanent_session_lifetime

_request_ctx_stack -> .globals
    attributes in stack:
    app = the active Flask application.
    url_adapter = the UTL adapter that was used to match the request.
    request = the current request object.
    session = the active session object.
    g = an object with all the attributes of the flask.g object.
    flashes = an internal cache for the flashed messages.

_app_ctx_stack -> .globals
    active application context

has_request_context() -> .ctx
    test if a request context is there

has_app_context() -> .ctx
    test if app context available 

after_this_request(f) -> .ctx
    a decorator that accept function with passed response object as first argument.
    ```python
    @after_this_request
    def add_header(response):
        response.headers['X-Foo'] = 'Parachute'
        return response
    ```
copy_current_request_context -> .ctx
    This is usefull when working with greenets
    ```python
    @copy_current_request_context
    def do_some_work():
        # do some work here, it can access flask.request
        ...
    gevent.spawn(do_some_work)
    ```

Blueprint(name, import_name, static_folder=None,
          static_url_path=None, template_folder=None, url_prefix=None,
          subdomain=None, url_defaults=None, root_path=None) -> .blueprints
    ```python
    from flask import Blueprint, render_template, abort
    form jinja2 import TemplateNotFound

    simple_page = Blueprint('simple_page', __name__,
                            template_folder='templates')

    @simple_page.route('/', defaults={'page': 'index'})
    @simple_page.route('/<page>'):
    def show(page):
        try:
            return render_template('page/%s.html' % page)
        except TemplateNotFound:
            abort(404)
    ```

render_template(templat_name_or_list, **context) -> .templating
    ```python
        ...
        return render_template('page/%s.html' % page)
    ```

render_template_string(source, **context) -> .templating
    Renders a template from source

signals_available -> .signals
    checking whether signaling system is available. it uses blinker lib.

template_rendered -> .signals
    This signal is sent when a template was successfully rendered.

request_started -> .signals
    This signal sent when the request context is setup.

request_finished -> .signals
    This signal is sent right before the response is sent the client.

got_request_exception -> .signals
    This signal is sent when an exception happens during request processing.

request_tearing_down -> .signals
    This signal is sent when the request is treaing down.

appcontext_tearing_down -> .signals
    This signal is sent when the app context is treaing down.

appcontext_pushed -> .signals
    set when an application context is pushed.

appcontext_popped -> .signals
    set when an application context is popped.

message_flashed -> .signals
    The signal is sent when the application is flashing a message.

before_render_template -> .signals
    The signal is sent before template rendering process.

Session[SecureCookieSession](initial=True) -> .sessions

jsonify         =>  json.jsonify
json_available  =>  True
