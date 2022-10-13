from flask import Blueprint, render_template

home_app = Blueprint('home_app', __name__, template_folder='../templates')

@home_app.route('/', methods=['GET'], endpoint="home")
def home():
    return render_template('index.html')
