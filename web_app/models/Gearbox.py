from helpers.database import db

class GearboxDBModel(db.Model):

    __tablename__ = 'gearboxes'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, data):
        self.title = data['title']

    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'title': self.title,
        }
        