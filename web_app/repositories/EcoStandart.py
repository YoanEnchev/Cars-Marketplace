from repositories.Base import BaseRepository
from models.EcoStandart import EcoStandartDBModel

class EcoStandartRepository(BaseRepository):
    
    entity:object = EcoStandartDBModel