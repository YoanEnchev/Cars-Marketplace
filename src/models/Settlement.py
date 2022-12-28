from run import db

from src.models.Region import Region

class Settlement(db.Model):

    __tablename__ = 'settlements'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    
    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'))
    region = db.relationship(Region, lazy="joined") # Eager load.

    def __init__(self, data):
        self.title = data['title']
        self.region_id = data['region_id']

    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'region_id': self.region_id,
            'title': self.title
        }
        