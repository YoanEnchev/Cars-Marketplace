from flask import Flask
from dotenv import load_dotenv
import os, sys


# Load different environments variables if running pytest.
load_dotenv('.flaskenv.test' if 'pytest' in sys.modules else '.flaskenv')

env_data = os.environ

main_app = Flask(__name__, static_folder= '../' + env_data['STATIC_FOLDER_PATH'])

main_app.config['SQLALCHEMY_DATABASE_URI'] = env_data['DB_URL']
main_app.config['SQLALCHEMY_ECHO'] = env_data['FLASK_DEBUG'] # prints what SQL queries are made if debug is enabled.

# Needed for session.
main_app.secret_key = env_data['SECRET_KEY']