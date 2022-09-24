from flask import Blueprint, render_template

users_app = Blueprint('users_app', __name__, template_folder='templates')

@users_app.route('/login')
def show_login():
    return render_template('users/login.html')
