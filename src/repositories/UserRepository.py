from src.repositories.BaseRepository import BaseRepository
from src.models.User import User

class UserRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(User)

    def find_by_email(self, email: str):
        return self.entity.query.filter_by(email=email).first()
