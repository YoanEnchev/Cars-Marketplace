from injector import inject

from src.models.User import User
from src.repositories.UserRepository import UserRepository
from src.services.BaseModelService import BaseModelService

class UserService(BaseModelService):
    
    @inject
    def __init__(self, user_repo: UserRepository):
        self.model_repository = user_repo

    def get_user_by_email(self, email: str) -> User|None:
        return self.model_repository.find_by_email(email)