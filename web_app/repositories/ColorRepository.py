from repositories.BaseRepository import BaseRepository
from models import ColorDBModel

class ColorRepository(BaseRepository):
    
    entity:object = ColorDBModel