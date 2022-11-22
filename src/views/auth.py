from flask import Blueprint, render_template, flash, redirect, url_for, request, session
from flask_login import login_user, login_required, logout_user
from flask_injector import FlaskInjector
from injector import inject
from werkzeug.security import check_password_hash
from run import db

from src.forms.RegistrationForm import RegistrationForm
from src.services.get_err_msg_for_form import get_err_msg_for_form
from src.services.UserService import UserService
from src.models.User import User

auth_app = Blueprint('auth_app', __name__, template_folder='templates')


@auth_app.route('/register', methods=['GET', 'POST'], endpoint="register")
def register():
    session_form_key = 'registration_data'
    
    if request.method == 'GET':
        return render_template('auth/register.html', form_values=session.get(session_form_key))

    # On submitting registration form:
    req_params = request.form
    form = RegistrationForm(req_params)
    
    is_valid_Form = form.validate() # Make sure validate() is called before get_err_msg_for_form.
    
    # Assume invalid request.
    [flash_msg, alert_status, endpoint] = [get_err_msg_for_form(form), 'danger', 'auth_app.register']
    session[session_form_key] = req_params # Set form field values so they are restored for form.

    if is_valid_Form:
        user = User(email = req_params['email'], first_name = req_params['name'], password = req_params['password'])
        db.session.add(user)
        db.session.commit()

        login_user(user)

        [flash_msg, alert_status, endpoint] = ['Successful registration.', 'primary', 'home_app.home']
        session.pop(session_form_key) # No need to store form values if form is valid and operation succeeds.
    
    
    flash(flash_msg, alert_status)
    return redirect(url_for(endpoint))


@inject
@auth_app.route('/login', methods=['GET', 'POST'], endpoint="login")
def login(user_service: UserService):
    
    if request.method == 'GET':
        return render_template('auth/login.html')

    user = user_service.get_user_by_email(request.form.get('email'))
    
    if user and check_password_hash(user.password, request.form.get('password')):
        return user_service.handle_successful_login(user)
    
    return user_service.handle_unsuccessful_login(user)


@auth_app.route("/logout", methods=['GET'], endpoint="logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for('home_app.home'))