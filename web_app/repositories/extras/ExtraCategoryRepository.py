from repositories.BaseRepository import BaseRepository
from models.extras import ExtraCategoryDBModel

class ExtraCategoryRepository(BaseRepository):
    
    entity:object = ExtraCategoryDBModel