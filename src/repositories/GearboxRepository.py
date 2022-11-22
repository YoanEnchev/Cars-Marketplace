from src.repositories.BaseRepository import BaseRepository
from src.models.Gearbox import Gearbox

class GearboxRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(Gearbox)