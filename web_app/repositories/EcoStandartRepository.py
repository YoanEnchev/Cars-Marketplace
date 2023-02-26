from repositories.BaseRepository import BaseRepository
from models import EcoStandartDBModel

class EcoStandartRepository(BaseRepository):
    
    entity:object = EcoStandartDBModel