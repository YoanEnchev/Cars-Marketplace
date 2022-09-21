from flask import Blueprint

users_app = Blueprint('users_app', __name__)

@users_app.route('/login')
def show_login_form():
    return 'Show login form'
