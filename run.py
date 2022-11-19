import os
from flask_sqlalchemy import SQLAlchemy
from flask import Flask
from flask_login import LoginManager


envData = os.environ
main_app = Flask(__name__)
main_app.config['SQLALCHEMY_DATABASE_URI'] = envData['DB_URL']

db = SQLAlchemy(main_app)


from src.views.home import home_app
from src.views.cars import cars_app
from src.views.auth import auth_app
from src.initializers.login_manager import login_manager

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

# Needed for session.
main_app.secret_key = envData['SECRET_KEY']