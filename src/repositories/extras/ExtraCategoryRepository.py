from src.repositories.BaseRepository import BaseRepository
from src.models.extras.ExtraCategory import ExtraCategory

class ExtraCategoryRepository(BaseRepository):
    
    entity:object = ExtraCategory