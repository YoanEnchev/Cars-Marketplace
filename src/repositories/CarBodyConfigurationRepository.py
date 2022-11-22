from src.repositories.BaseRepository import BaseRepository
from src.models.CarBodyConfiguration import CarBodyConfiguration

class CarBodyConfigurationRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(CarBodyConfiguration)