from src.repositories.BaseRepository import BaseRepository
from src.models.Model import Model

class ModelRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(Model)