from src.repositories.BaseRepository import BaseRepository
from src.models.extras.ExtraCategory import ExtraCategory

class ExtraCategoryRepository(BaseRepository):
    
    def __init__(self): 
        super().__init__(ExtraCategory)