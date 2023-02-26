from repositories.BaseRepository import BaseRepository
from models import ModelDBModel

class ModelRepository(BaseRepository):
    
    entity:object = ModelDBModel

    def get_by_make_and_model(self, make_id: int, model_title:str) -> object|None:
        # Filter by both make id and model title because some model titles are common
        # among different makes. Example model 'S' for both Mercedes and Hyundai.
        return self.entity.query.filter_by(make_id=make_id, title=model_title).first()