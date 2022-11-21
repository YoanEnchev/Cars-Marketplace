from injector import inject
from src.repositories.UserRepository import UserRepository

class UserService:
    @inject
    def __init__(self, user_repo: UserRepository):
        self.user_repo = user_repo

    def get_user_by_email(self, email: str):
        return self.user_repo.find_by_email(email)