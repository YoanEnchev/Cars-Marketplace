from repositories.Base import BaseRepository
from models.FuelType import FuelTypeDBModel

class FuelTypeRepository(BaseRepository):
    
    entity:object = FuelTypeDBModel