from src.repositories.BaseRepository import BaseRepository
from src.models.Color import Color

class ColorRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(Color)