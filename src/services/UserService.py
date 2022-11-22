from injector import inject
from werkzeug.wrappers import Response

from flask import redirect, url_for, flash
from flask_login import login_user

from src.repositories.UserRepository import UserRepository
from src.models.User import User

class UserService:

    regisration_session_key = ''

    @inject
    def __init__(self, user_repo: UserRepository):
        self.user_repo = user_repo

    def get_user_by_email(self, email: str):
        return self.user_repo.find_by_email(email)
    
    # Registration:
        


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