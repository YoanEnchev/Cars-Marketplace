from repositories.Base import BaseRepository
from models.extras.Extra import ExtraDBModel

class ExtraRepository(BaseRepository):
    
    entity:object = ExtraDBModel