from run import db

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

    hp = db.Column(db.Integer)
    price = db.Column(db.Float(precision=2), nullable=False)
    mileage = db.Column(db.Integer)

    modification = db.Column(db.String(20))
    description = db.Column(db.Text)
    views = db.Column(db.Integer)


    def __init__(self, make_id, model_id, fuel_type_id, eco_standart_id, gearbox_id, car_body_configuration_id, color_id,
        region_id, settlement_id, hp, price, mileage, modification, description, views):
        
        self.make_id = make_id
        self.model_id = model_id

        self.fuel_type_id = fuel_type_id
        self.eco_standart_id = eco_standart_id

        self.gearbox_id = gearbox_id
        self.car_body_configuration_id = car_body_configuration_id
        self.color_id = color_id

        self.region_id = region_id
        self.settlement_id = settlement_id

        self.hp = hp
        self.price = price
        self.mileage = mileage

        self.modification = modification
        self.description = description
        self.views = views
        