from flask import Blueprint, render_template, redirect, url_for, request, session
from flask_login import login_user, login_required, logout_user
from flask_injector import FlaskInjector
from injector import inject
from werkzeug.security import check_password_hash

from forms.User import RegistrationForm
from services.Auth import AuthService
from services.User import UserService

auth_app = Blueprint('auth_app', __name__, template_folder='templates')

@inject
@auth_app.route('/register', methods=['GET', 'POST'], endpoint="register")
def register(auth_service: AuthService):
    
    if request.method == 'GET':
        return render_template('auth/register.html', form_values=session.get('registration_data'))

    # On submitting registration form:
    req_params = request.form
    form = RegistrationForm(req_params)
    
    if form.validate():
        return auth_service.handle_user_registration(req_params)

    return auth_service.handle_unsuccessful_registration(req_params, form)


@inject
@auth_app.route('/login', methods=['GET', 'POST'], endpoint="login")
def login(auth_service: AuthService, user_service: UserService):
    
    if request.method == 'GET':
        return render_template('auth/login.html')
    
    user = user_service.get_user_by_email(request.form.get('email'))

    if user and check_password_hash(user.password, request.form.get('password')):
        return auth_service.handle_successful_login(user)
    
    return auth_service.handle_unsuccessful_login(user)


@login_required
@auth_app.route("/logout", methods=['GET'], endpoint="logout")
def logout():
    logout_user()
    return redirect(url_for('home_app.home'))