from repositories.Base import BaseRepository
from models.Region import RegionDBModel

class RegionRepository(BaseRepository):
    
    entity:object = RegionDBModel