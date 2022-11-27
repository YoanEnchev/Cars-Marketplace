from src.repositories.BaseRepository import BaseRepository
from src.models.Make import Make

class MakeRepository(BaseRepository):
    
    entity:object = Make