from flask_sqlalchemy import SQLAlchemy
from initializers.main_app import main_app

db = SQLAlchemy(main_app)