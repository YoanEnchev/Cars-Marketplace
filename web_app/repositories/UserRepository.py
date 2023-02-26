from repositories.BaseRepository import BaseRepository
from models import UserDBModel

class UserRepository(BaseRepository):
    
    entity:object = UserDBModel

    def find_by_email(self, email: str):
        return self.entity.query.filter_by(email=email).first()

