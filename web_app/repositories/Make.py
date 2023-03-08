from repositories.Base import BaseRepository
from models.Make import MakeDBModel

class MakeRepository(BaseRepository):
    
    entity:object = MakeDBModel

    def get_by_make(self, make_title:str) -> object|None:
        return self.entity.query.filter_by(title=make_title).first()