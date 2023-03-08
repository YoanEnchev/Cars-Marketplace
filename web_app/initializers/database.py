from flask_sqlalchemy import SQLAlchemy
from initializers.app import main_app

db = SQLAlchemy(main_app)