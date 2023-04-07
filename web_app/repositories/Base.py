from helpers.database import db
from helpers.serialization import serialize_model_list
from sqlalchemy.orm import joinedload

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
           
    def get_by_id(self, id: int, serialization: bool=False, relations: list=[]) -> object|None:
        return self.entity.query \
        .options(joinedload(relation) for relation in relations)\
        .get(id)

    def get_by_id_list(self, ids:list):
        return self.entity.query.filter(self.entity.id.in_(ids)).all()

    def permanent_delete(self, entity_object, flush: bool = False):

        self.entity.query.filter_by(id=entity_object.id).delete()

        if flush:
            self.db.session.commit()