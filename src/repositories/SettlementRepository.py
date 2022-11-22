from src.repositories.BaseRepository import BaseRepository
from src.models.Settlement import Settlement

class SettlementRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(Settlement)