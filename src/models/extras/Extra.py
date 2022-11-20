from run import db

class Extra(db.Model):

    __tablename__ = 'extras'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    extra_category_id = db.Column(db.Integer, db.ForeignKey('extras_categories.id'))

    def __init__(self, title, category_id):
        self.title = title
        self.extra_category_id = category_id
        