from werkzeug.wrappers import Response

from flask import redirect, url_for, flash, session
from flask_login import login_user
from injector import inject
from src.services.get_err_msg_for_form import get_err_msg_for_form

from src.models.User import User
from src.services.UserService import UserService
from src.forms.RegistrationForm import RegistrationForm

class AuthService:

    regisration_session_key = 'registration_data'

    @inject
    def __init__(self, user_service: UserService):
        self.user_service = user_service
    
    # Registration:
    def handle_user_registration(self, form_data: dict) -> Response:
        user = self.user_service.create(data=form_data, commit=True)
        login_user(user)

        if session.get(self.regisration_session_key):
             session.pop(self.regisration_session_key) # No need to store form values if form is valid and operation succeeds.

        flash('Successful registration.', 'primary')
        return redirect(url_for('home_app.home'))

    def handle_unsuccessful_registration(self, form_data: dict, form: RegistrationForm) -> Response:
        session[self.regisration_session_key] = form_data # Set form field values so they are restored for form.

        flash(get_err_msg_for_form(form), 'danger')
        return redirect(url_for('auth_app.register'))


    # Login
    def handle_successful_login(self, user: User|None) -> Response:
        login_user(user)

        return redirect(url_for('home_app.home'))

    def handle_unsuccessful_login(self, user: User|None) -> Response:
        message = 'Invalid login credentials.'

        if not user:
            message = "User with such email doesn't exist"

        flash(message, 'danger')

        return redirect(url_for('auth_app.login'))