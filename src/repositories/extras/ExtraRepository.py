from src.repositories.BaseRepository import BaseRepository
from src.models.extras.Extra import Extra

class ExtraRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(Extra)