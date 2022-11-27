from run import db

class FuelType(db.Model):

    __tablename__ = 'fuel_types'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, data):
        self.title = data['title']

    @property
    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
        }
        