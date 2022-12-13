from run import db
from src.services.helpers.serialize_model_list import serialize_model_list

class BaseRepository:

    entity:object = NotImplementedError

    def __init__(self):
        self.db = db # Makes it accessible by class children.

    # CREATE:
    def create(self, entity, commit: bool = False) -> object:
        self.db.session.add(entity)

        if commit:
            self.db.session.commit()

        return entity

    # READ:
    def get_all(self, serialization: bool, relations = []):
        records = self.entity.query.all()

        if (serialization):
            return serialize_model_list(records, relations)
        
        return records
           
    def get_by_id(self, id: int, serialization: bool) -> object|None:
        return self.entity.query.get(id)

    def get_by_id_list(self, ids:list):
        return self.entity.query.filter(self.entity.id.in_(ids)).all()

    # DELETE:
    def permanent_delete(self, entity_object):
        self.db.delete(entity_object) 