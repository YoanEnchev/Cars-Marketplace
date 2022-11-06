from run import db

class EcoStandart(db.Model):

    __tablename__ = 'eco_standarts'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, title):
        self.title = title
        