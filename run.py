import os
from flask_sqlalchemy import SQLAlchemy
from flask import Flask
from flask_login import LoginManager


envData = os.environ
main_app = Flask(__name__)
main_app.config['SQLALCHEMY_DATABASE_URI'] = envData['DB_URL']

db = SQLAlchemy(main_app)

login_manager = LoginManager()
login_manager.login_view = 'auth.login'
login_manager.init_app(main_app)

@login_manager.user_loader
def load_user(user_id):
    return User.get(user_id)

from src.views.home import home_app
from src.views.cars import cars_app
from src.views.auth import auth_app

from flask_migrate import Migrate

# flask run
# 123456   common
# flask seed

# Notice imports after this line import db from this file.

# Import all models (even if they're not used), so db.create_all() creates their tables
from src.models import *
from src.models.extras import *

from src.commands.seeders.main_seeder import seed
main_app.cli.add_command(seed)

# Register all apps views:
main_app.register_blueprint(home_app)
main_app.register_blueprint(cars_app)
main_app.register_blueprint(auth_app)

# Needed for session.
main_app.secret_key = envData['SECRET_KEY']

# migrate = Migrate()
# migrate.init_app(main_app, db)

with main_app.app_context():
    # Create tables of each models
    db.create_all()
    db.session.commit()