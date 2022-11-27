from src.repositories.BaseRepository import BaseRepository
from src.models.Settlement import Settlement

class SettlementRepository(BaseRepository):
    
    entity:object = Settlement