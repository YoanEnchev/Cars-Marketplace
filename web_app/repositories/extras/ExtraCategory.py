from repositories.Base import BaseRepository
from models.extras.ExtraCategory import ExtraCategoryDBModel

class ExtraCategoryRepository(BaseRepository):
    
    entity:object = ExtraCategoryDBModel