from initializers.database import db
from models.tables.VehicleExtra import VehicleExtraDBTable
from models.extras.ExtraCategory import ExtraCategoryDBModel

class ExtraDBModel(db.Model):

    __tablename__ = 'extras'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    
    extra_category_id = db.Column(db.Integer, db.ForeignKey('extras_categories.id'))
    extra_category = db.relationship(ExtraCategoryDBModel, lazy="joined") # Eager load make.
    
    vehicles = db.relationship('VehicleAdDBModel', secondary=VehicleExtraDBTable, backref='extras_vehicle')

    def __init__(self, data):
        self.title = data['title']
        self.extra_category_id = data['category_id']

    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'title': self.title,
        }
        