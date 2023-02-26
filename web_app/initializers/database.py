from flask_sqlalchemy import SQLAlchemy
from initializers import main_app

db = SQLAlchemy(main_app)