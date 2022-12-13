from run import db
from src.services.helpers.serialize_model_list import serialize_model_list

class Make(db.Model):

    __tablename__ = 'makes'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    
    # Eager load models.
    models = db.relationship("Model", backref='model', lazy='joined')

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