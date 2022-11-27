from src.repositories.BaseRepository import BaseRepository
from src.models.FuelType import FuelType

class FuelTypeRepository(BaseRepository):
    
    entity:object = FuelType