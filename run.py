from flask import Flask
main_app = Flask(__name__)

from src.views.home import home_app
from src.views.cars import cars_app
from src.views.auth import auth_app

# Register all apps views:
main_app.register_blueprint(home_app)
main_app.register_blueprint(cars_app)
main_app.register_blueprint(auth_app)
