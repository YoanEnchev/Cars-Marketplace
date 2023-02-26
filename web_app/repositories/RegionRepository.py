from repositories.BaseRepository import BaseRepository
from models import RegionDBModel

class RegionRepository(BaseRepository):
    
    entity:object = RegionDBModel