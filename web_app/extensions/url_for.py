from initializers.app import main_app
from flask import url_for

# For some reason (due to the dependency injector) the following exception is thrown "TypeError: Injecting Any is not supported".
# when calling url_for in Jinja (the template engine) but it doesn't throw the exception when called in python (for example the view).
# Thats why we overwrite te url_for function and use it's custom alternative in jinja.
def url_for_route(endpoint, **kwargs):
    return url_for(endpoint, **kwargs)

def asset_url(filename):
    return url_for('static', filename=filename)

main_app.jinja_env.globals.update(
    url_for=url_for_route,
    asset_url=asset_url
)

