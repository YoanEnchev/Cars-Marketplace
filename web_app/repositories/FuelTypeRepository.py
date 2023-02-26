from repositories.BaseRepository import BaseRepository
from models import FuelTypeDBModel

class FuelTypeRepository(BaseRepository):
    
    entity:object = FuelTypeDBModel