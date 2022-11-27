from src.repositories.BaseRepository import BaseRepository
from src.models.User import User

class UserRepository(BaseRepository):
    
    entity:object = User

    def find_by_email(self, email: str):
        return self.entity.query.filter_by(email=email).first()