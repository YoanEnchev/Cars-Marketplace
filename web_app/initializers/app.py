from flask import Flask
from dotenv import load_dotenv
import os, sys

main_app = Flask(__name__, static_folder='../static')

if 'pytest' in sys.modules:
    load_dotenv('.test_flaskenv') # Load different environments variables if running pytest.

env_data = os.environ
main_app.config['SQLALCHEMY_DATABASE_URI'] = env_data['DB_URL']
main_app.config['SQLALCHEMY_ECHO'] = env_data['FLASK_DEBUG'] # prints what SQL queries are made if debug is enabled.

# Needed for session.
main_app.secret_key = env_data['SECRET_KEY']