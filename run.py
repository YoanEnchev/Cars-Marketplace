import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_injector import FlaskInjector
from flask_login import LoginManager # Enable authentification.
from dotenv import load_dotenv

called_from_test = "PYTEST_CURRENT_TEST" in os.environ # Make sure it's checked before load_dotenv is called.
load_dotenv('.flaskenv') # Loads env so it's visibly by pytest
envData = os.environ

main_app = Flask(__name__)

main_app.config['SQLALCHEMY_DATABASE_URI'] = envData['DB_URL'] #if called_from_test else envData['DB_URL_TEST']
main_app.config['SQLALCHEMY_ECHO'] = envData['FLASK_DEBUG'] # prints what SQL queries are made if debug is enabled.

db = SQLAlchemy(main_app)

from src.views.home import home_app
from src.views.cars import cars_app
from src.views.auth import auth_app
from src.views.admin import admin_app
from src.initializers.login_manager import login_manager

import src.views.status_codes # Register status codes.

# flask run
# 123456   common
# flask seed

# Notice imports after this line import db from this file.
# Import all models (even if they're not used), so db.create_all() creates their tables
from src.models import *
from src.models.extras import *

from src.commands.seeder import seed
from src.commands.drop_tables import drop_tables


main_app.cli.add_command(seed)
main_app.cli.add_command(drop_tables)

# Register all apps views:
main_app.register_blueprint(home_app)
main_app.register_blueprint(cars_app)
main_app.register_blueprint(auth_app)
main_app.register_blueprint(admin_app)

# Needed for session.
main_app.secret_key = envData['SECRET_KEY']

# Register extensions:
from src.extensions.url_for import url_for


# Setup Flask Injector, this has to happen AFTER routes are added
from dependencies import configure
FlaskInjector(app=main_app, modules=[configure])