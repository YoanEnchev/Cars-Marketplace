from werkzeug.wrappers import Response
from werkzeug.datastructures import ImmutableMultiDict

from flask import redirect, url_for, flash, session
from flask_login import login_user
from injector import inject
from models.User import UserDBModel

from services.User import UserService
from services.Form import FormService
from forms.User import RegistrationForm

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

    def handle_unsuccessful_registration(self, form_data: ImmutableMultiDict, form: RegistrationForm) -> Response:

        data = dict(form_data) # Make dict mutable.

        del data['password']
        del data['repeat_password']

        session[self.regisration_session_key] = data # Set form field values so they are restored for form.

        flash(self.form_service.get_error_message(form), 'danger')
        return redirect(url_for('auth_app.register'))


    # Login
    def handle_successful_login(self, user: UserDBModel|None) -> Response:
        login_user(user)
        flash('Успешнo влизане.', 'primary')

        return redirect(url_for('home_app.home'))

    def handle_unsuccessful_login(self, user: UserDBModel|None) -> Response:
        message = 'Невалидна парола.'

        if not user:
            message = "Потребител с такъв имейл не съществува."

        flash(message, 'danger')

        return redirect(url_for('auth_app.login'))