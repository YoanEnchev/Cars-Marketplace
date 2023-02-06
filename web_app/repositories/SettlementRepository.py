from repositories.BaseRepository import BaseRepository
from models.Settlement import Settlement

class SettlementRepository(BaseRepository):
    
    entity:object = Settlement