from src.repositories.BaseRepository import BaseRepository
from src.models.FuelType import FuelType

class FuelTypeRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(FuelType)