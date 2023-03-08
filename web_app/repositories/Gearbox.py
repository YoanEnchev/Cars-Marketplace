from repositories.Base import BaseRepository
from models.Gearbox import GearboxDBModel

class GearboxRepository(BaseRepository):
    
    entity:object = GearboxDBModel