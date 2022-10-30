from run import db

class Settlement(db.Model):

    __tablename__ = 'settlements'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'))

    def __init__(self, title, region_id):
        self.title = title
        self.region_id = region_id
        