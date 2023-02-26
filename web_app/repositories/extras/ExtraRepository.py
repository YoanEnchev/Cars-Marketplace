from repositories.BaseRepository import BaseRepository
from models.extras import ExtraDBModel

class ExtraRepository(BaseRepository):
    
    entity:object = ExtraDBModel