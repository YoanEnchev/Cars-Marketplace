from run import db

class Gearbox(db.Model):

    __tablename__ = 'gearboxes'

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
        