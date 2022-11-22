from src.repositories.BaseRepository import BaseRepository
from src.models.VehicleAd import VehicleAd

class VehicleAdRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(VehicleAd)