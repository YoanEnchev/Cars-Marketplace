# Import libraries
from flask_injector import FlaskInjector
from dependencies import configure

# Import views
from views.home import home_app
from views.cars import cars_app
from views.auth import auth_app
from views.admin import admin_app

import views.status_codes # Register status codes.

# Register commands
from commands.seeder import seed
from commands.drop_tables import drop_tables

# Register extensions:
from extensions.url_for import url_for

# Import initializers
from helpers.login import login_manager # login_manager enables authentication

from app import main_app

main_app.cli.add_command(seed)
main_app.cli.add_command(drop_tables)

# Register all apps views:
main_app.register_blueprint(home_app)
main_app.register_blueprint(cars_app)
main_app.register_blueprint(auth_app)
main_app.register_blueprint(admin_app)

# Setup Flask Injector, this has to happen AFTER views are added
FlaskInjector(app=main_app, modules=[configure])

