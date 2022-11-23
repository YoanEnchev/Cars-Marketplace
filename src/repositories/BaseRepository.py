from sqlalchemy import and_
from sqlalchemy.orm import Session

from run import db

class BaseRepository:

    entity:object = NotImplementedError

    def __init__(self, entity:object):
        self.entity = entity
        self.db = db

    # CREATE:
    def create(self, entity, commit = False) -> object:
        self.db.session.add(entity)

        if commit:
            self.db.session.commit()

        return entity

    # READ:
    def get_all(self):
        return self.db.query(self.entity)
           
    def get_by_id(self, id:int):
        return self.db.query(self.entity).filter(self.entity.id==id).one()

    # DELETE:
    def permanent_delete(self, entity):
        self.db.delete(entity) 