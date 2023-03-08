from repositories.Base import BaseRepository
from models.Settlement import SettlementDBModel

class SettlementRepository(BaseRepository):
    
    entity:object = SettlementDBModel