from initializers.db import db

class EcoStandart(db.Model):

    __tablename__ = 'eco_standarts'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, data):
        self.title = data['title']
    
    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'title': self.title,
        }