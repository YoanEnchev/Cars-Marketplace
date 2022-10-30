from unicodedata import name
from run import db

class VehicleType(db.Model):

    __tablename__ = 'vehicle_types'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, title):
        self.title = title
        