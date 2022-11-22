from src.repositories.BaseRepository import BaseRepository
from src.models.EcoStandart import EcoStandart

class EcoStandartRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(EcoStandart)