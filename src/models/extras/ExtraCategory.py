from run import db

class ExtraCategory(db.Model):

    __tablename__ = 'extra_categories'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, title):
        self.title = title
        