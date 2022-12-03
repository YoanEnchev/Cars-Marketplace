from run import db
from src.models.tables.VehicleExtra import VehicleExtra

class VehicleAd(db.Model):

    __tablename__ = 'vehicle_ads'

    id = db.Column(db.Integer, primary_key = True)
    
    make_id = db.Column(db.Integer, db.ForeignKey('makes.id'))
    model_id = db.Column(db.Integer, db.ForeignKey('models.id'))

    fuel_type_id = db.Column(db.Integer, db.ForeignKey('fuel_types.id'))
    eco_standart_id = db.Column(db.Integer, db.ForeignKey('eco_standarts.id'))

    gearbox_id = db.Column(db.Integer, db.ForeignKey('gearboxes.id'))
    car_body_configuration_id = db.Column(db.Integer, db.ForeignKey('car_body_configurations.id'), nullable = True)
    color_id = db.Column(db.Integer, db.ForeignKey('colors.id'))

    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'))
    settlement_id = db.Column(db.Integer, db.ForeignKey('settlements.id'))

    extras = db.relationship('Extra', secondary=VehicleExtra, backref='vehicle_ads')

    hp = db.Column(db.Integer)
    price = db.Column(db.Float(precision=2), nullable=False)
    mileage = db.Column(db.Integer)

    modification = db.Column(db.String(20))
    description = db.Column(db.Text)
    views = db.Column(db.Integer)


    def __init__(self, data):
        
        self.make_id = data['make_id']
        self.model_id = data['model_id']

        self.fuel_type_id = data['fuel_type_id']
        self.eco_standart_id = data['eco_standart_id']

        self.gearbox_id = data['gearbox_id']
        self.car_body_configuration_id = data['car_body_configuration_id']
        self.color_id = data['color_id']

        self.region_id = data['region_id']
        self.settlement_id = data['settlement_id']

        self.hp = data['hp']
        self.price = data['price']
        self.mileage = data['mileage']

        self.modification = data['modification'] or ''
        self.description = data['description'] or ''
        self.views = 0
        