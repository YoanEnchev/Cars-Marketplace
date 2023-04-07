from helpers.database import db

class ModelDBModel(db.Model):

    __tablename__ = 'models'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    make_id = db.Column(db.Integer, db.ForeignKey('makes.id'))
    make = db.relationship('MakeDBModel', lazy="joined") # Eager load make.

    def __init__(self, data):
        self.title = data['title']
        self.make_id = data['make_id']

    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'title': self.title,
        }