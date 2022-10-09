from flask import Blueprint, render_template

auth_app = Blueprint('auth_app', __name__, template_folder='templates')

@auth_app.route('/login', methods=['GET'], endpoint="login-form")
def show_login():
    return render_template('auth/login.html')

@auth_app.route('/register', methods=['GET'], endpoint="register-form")
def show_register():
    return render_template('auth/register.html')
