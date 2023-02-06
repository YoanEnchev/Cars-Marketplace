from initializers.db import db
from services.helpers.serialize_model_list import serialize_model_list

class ExtraCategory(db.Model):

    __tablename__ = 'extras_categories'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    # Eager load extras.
    extras = db.relationship("Extra", backref='extra', lazy='joined')

    def __init__(self, data):
        self.title = data['title']

    def serialize(self, relations=[]):
        return {
            'id': self.id,
            'title': self.title,
            'items': serialize_model_list(self.extras)
        }
        