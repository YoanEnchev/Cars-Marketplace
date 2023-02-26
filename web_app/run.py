# Import libraries
from flask_injector import FlaskInjector
from dependencies import configure

# Import views
from views import home_app, cars_app, auth_app, admin_app
import views.status_codes # Register status codes.

# Register commands
from commands import seed, drop_tables

# Register extensions:
from extensions import url_for

# Import initializers
from initializers import login_manager, main_app # login_manager enables authentication

main_app.cli.add_command(seed)
main_app.cli.add_command(drop_tables)

# Register all apps views:
main_app.register_blueprint(home_app)
main_app.register_blueprint(cars_app)
main_app.register_blueprint(auth_app)
main_app.register_blueprint(admin_app)

# Setup Flask Injector, this has to happen AFTER views are added
FlaskInjector(app=main_app, modules=[configure])

