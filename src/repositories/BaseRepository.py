from sqlalchemy import and_
from sqlalchemy.orm import Session

from run import db

class BaseRepository:

    entity:object = NotImplementedError

    def __init__(self, entity:object):
        self.entity = entity
        self.db = db

    def get_all(self):
        return self.db.query(self.entity)
           
    def get_by_id(self, id:int):
        return self.db.query(self.entity).filter(self.entity.id==id).one()

    def add(self, entity):
        self.db.add(entity)

    def permanent_delete(self, entity):
        self.db.delete(entity) 