from flask import Flask
from dotenv import load_dotenv
import os



main_app = Flask(__name__, static_folder='../static')
load_dotenv('.flaskenv') # Loads env so it's visibly by pytest

env_data = os.environ

main_app.config['SQLALCHEMY_DATABASE_URI'] = env_data['DB_URL'] #if called_from_test else env_data['DB_URL_TEST']
main_app.config['SQLALCHEMY_ECHO'] = env_data['FLASK_DEBUG'] # prints what SQL queries are made if debug is enabled.

# Needed for session.
main_app.secret_key = env_data['SECRET_KEY']