from repositories.BaseRepository import BaseRepository
from models import GearboxDBModel

class GearboxRepository(BaseRepository):
    
    entity:object = GearboxDBModel