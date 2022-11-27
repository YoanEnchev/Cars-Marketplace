from src.repositories.BaseRepository import BaseRepository
from src.models.Color import Color

class ColorRepository(BaseRepository):
    
    entity:object = Color