from run import db
from src.models.tables.VehicleExtra import VehicleExtra
from src.models.extras.ExtraCategory import ExtraCategory

class Extra(db.Model):

    __tablename__ = 'extras'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    
    extra_category_id = db.Column(db.Integer, db.ForeignKey('extras_categories.id'))
    extra_category = db.relationship(ExtraCategory, lazy="joined") # Eager load make.
    
    vehicles = db.relationship('VehicleAd', secondary=VehicleExtra, backref='extras_vehicle')

    def __init__(self, data):
        self.title = data['title']
        self.extra_category_id = data['category_id']

    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'title': self.title,
        }
        