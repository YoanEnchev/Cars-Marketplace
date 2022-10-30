import os
from flask_sqlalchemy import SQLAlchemy
from flask import Flask

from src.views.home import home_app
from src.views.cars import cars_app
from src.views.auth import auth_app

from flask_migrate import Migrate

# flask run
# 123456   common
# flask seed


main_app = Flask(__name__)
main_app.config ['SQLALCHEMY_DATABASE_URI'] = os.environ['DB_URL']

db = SQLAlchemy(main_app)
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

# migrate = Migrate()
# migrate.init_app(main_app, db)

with main_app.app_context():
    # Create tables of each models
    db.create_all()
    db.session.commit()