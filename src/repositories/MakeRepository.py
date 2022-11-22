from src.repositories.BaseRepository import BaseRepository
from src.models.Make import Make

class MakeRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(Make)