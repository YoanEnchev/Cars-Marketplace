from werkzeug.wrappers import Response

from flask import redirect, url_for, flash, session
from flask_login import login_user
from injector import inject

from src.models.User import User
from src.services.UserService import UserService
from src.services.FormService import FormService
from src.forms.RegistrationForm import RegistrationForm

class AuthService:

    regisration_session_key = 'registration_data'

    @inject
    def __init__(self, user_service: UserService, form_service: FormService):
        self.user_service = user_service
        self.form_service = form_service
    
    # Registration:
    def handle_user_registration(self, form_data: dict) -> Response:
        user = self.user_service.create(data=form_data, commit=True)
        login_user(user)

        if session.get(self.regisration_session_key):
             session.pop(self.regisration_session_key) # No need to store form values if form is valid and operation succeeds.

        flash('Успешна регистрация.', 'primary')
        return redirect(url_for('home_app.home'))

    def handle_unsuccessful_registration(self, form_data: dict, form: RegistrationForm) -> Response:
        session[self.regisration_session_key] = form_data # Set form field values so they are restored for form.

        flash(self.form_service.get_error_message(form), 'danger')
        return redirect(url_for('auth_app.register'))


    # Login
    def handle_successful_login(self, user: User|None) -> Response:
        login_user(user)

        return redirect(url_for('home_app.home'))

    def handle_unsuccessful_login(self, user: User|None) -> Response:
        message = 'Невалидна парола.'

        if not user:
            message = "Потребител с такъв имейл не съществува"

        flash(message, 'danger')

        return redirect(url_for('auth_app.login'))