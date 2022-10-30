from run import db

class Color(db.Model):

    __tablename__ = 'colors'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, title):
        self.title = title
        