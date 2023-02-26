from repositories.BaseRepository import BaseRepository
from models import SettlementDBModel

class SettlementRepository(BaseRepository):
    
    entity:object = SettlementDBModel