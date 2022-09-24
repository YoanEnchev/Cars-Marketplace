from flask import Flask
main_app = Flask(__name__)

from src.views.cars import cars_app
from src.views.users import users_app

# Register all apps views:
main_app.register_blueprint(cars_app)
main_app.register_blueprint(users_app)
