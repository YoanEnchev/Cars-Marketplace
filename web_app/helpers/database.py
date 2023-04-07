from flask_sqlalchemy import SQLAlchemy
from app import main_app

db = SQLAlchemy(main_app)