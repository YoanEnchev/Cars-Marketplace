from run import db

class Gearbox(db.Model):

    __tablename__ = 'gearboxes'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, title):
        self.title = title
        