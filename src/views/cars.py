from flask import Blueprint, render_template

cars_app = Blueprint('cars_app', __name__, template_folder='../templates')

@cars_app.route('/', methods=['GET'], endpoint="home")
def home():
    return render_template('cars/index.html')
