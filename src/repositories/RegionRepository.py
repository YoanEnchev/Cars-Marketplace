from src.repositories.BaseRepository import BaseRepository
from src.models.Region import Region

class RegionRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(Region)