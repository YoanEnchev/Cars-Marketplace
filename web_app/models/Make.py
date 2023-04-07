from helpers.database import db
from helpers.serialization import serialize_model_list
#from models.Model import ModelDBModel

class MakeDBModel(db.Model):

    __tablename__ = 'makes'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    
    # Eager load models.
    models = db.relationship('ModelDBModel', backref='model', lazy='joined')

    def __init__(self, data):
        self.title = data['title']
        
    def serialize(self, relations = []):

        result = {
            'id': self.id,
            'title': self.title,
        }

        if 'models' in relations:
            result['models'] = serialize_model_list(self.models)

        return result