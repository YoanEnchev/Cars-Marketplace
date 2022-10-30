from run import db

class VehicleAds(db.Model):

    __tablename__ = 'vehicle_ads'

    id = db.Column(db.Integer, primary_key = True)
    vehicle_type_id = db.Column(db.Integer, db.ForeignKey('vehicle_types.id'))
    
    make_id = db.Column(db.Integer, db.ForeignKey('makes.id'))
    model_id = db.Column(db.Integer, db.ForeignKey('models.id'))

    fuel_type_id = db.Column(db.Integer, db.ForeignKey('fuel_types.id'))
    eco_standart_id = db.Column(db.Integer, db.ForeignKey('eco_standarts.id'))

    gearbox_id = db.Column(db.Integer, db.ForeignKey('gearboxes.id'))
    car_body_configuration_id = db.Column(db.Integer, db.ForeignKey('car_body_configurations.id'), nullable = True)
    color_id = db.Column(db.Integer, db.ForeignKey('colors.id'))

    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'))
    settlement_id = db.Column(db.Integer, db.ForeignKey('settlements.id'))

    modification = db.Column(db.String(20))
    hp = db.Column(db.Integer)
    price = db.Column(db.Float(precision=2), nullable=False)
    mileage = db.Column(db.Integer)
    description = db.Column(db.Text)

    views = db.Column(db.Integer)


    def __init__(self, x):
        self.x = x
        