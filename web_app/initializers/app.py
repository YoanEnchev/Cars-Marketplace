from flask import Flask
import os, sys

env_data = os.environ

static_folder_env_key = 'STATIC_FOLDER_PATH'
db_url_env_key = 'DB_URL'
sql_alchemy_echo = env_data['FLASK_DEBUG']

if 'pytest' in sys.modules:
    static_folder_env_key += '_TEST'
    db_url_env_key += '_TEST'
    sql_alchemy_echo = False


main_app = Flask(__name__, static_folder= '../' + env_data[static_folder_env_key])

main_app.config['SQLALCHEMY_DATABASE_URI'] = env_data[db_url_env_key]
main_app.config['SQLALCHEMY_ECHO'] = sql_alchemy_echo # prints what SQL queries are made if debug is enabled.

# Needed for session.
main_app.secret_key = env_data['SECRET_KEY']