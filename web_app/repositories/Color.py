from repositories.Base import BaseRepository
from models.Color import ColorDBModel

class ColorRepository(BaseRepository):
    
    entity:object = ColorDBModel