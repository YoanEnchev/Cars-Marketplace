from injector import inject

from models.User import User
from repositories.UserRepository import UserRepository
from services.BaseModelService import BaseModelService

class UserService(BaseModelService):
    
    @inject
    def __init__(self, user_repo: UserRepository):
        self.model_repository = user_repo

    def get_user_by_email(self, email: str) -> User|None:
        return self.model_repository.find_by_email(email)