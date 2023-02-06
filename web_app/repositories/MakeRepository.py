from repositories.BaseRepository import BaseRepository
from models.Make import Make

class MakeRepository(BaseRepository):
    
    entity:object = Make

    def get_by_make(self, make_title:str) -> object|None:
        return self.entity.query.filter_by(title=make_title).first()