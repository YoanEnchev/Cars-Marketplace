from run import db

class Extra(db.Model):

    __tablename__ = 'extras'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    extra_category_id = db.Column(db.Integer, db.ForeignKey('extras_categories.id'))

    def __init__(self, data):
        self.title = data['title']
        self.extra_category_id = data['category_id']

    @property
    def serialize(self):
        return {
            'id': self.id,
            'title': self.title,
        }
        