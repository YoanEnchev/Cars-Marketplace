from run import db

class ExtraCategory(db.Model):

    __tablename__ = 'extras'

    id = db.Column(db.Integer, primary_key=True)
    key = db.Column(db.String(80), nullable=False)
    extra_category_id = db.Column(db.Integer, db.ForeignKey('extra_categories.id'))

    def __init__(self, key):
        self.key = key
        