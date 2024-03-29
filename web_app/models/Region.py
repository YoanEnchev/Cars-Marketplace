from helpers.database import db
from helpers.serialization import serialize_model_list

class RegionDBModel(db.Model):

    __tablename__ = 'regions'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    
    # Eager load settlements.
    settlements = db.relationship('SettlementDBModel', backref='settlement', lazy='joined')

    def __init__(self, data):
        self.title = data['title']

    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'title': self.title,
            'settlements': serialize_model_list(self.settlements)
        }
        