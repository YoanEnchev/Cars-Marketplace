import os
from flask import url_for, request
from flask_login import current_user
from helpers.database import db
from helpers.serialization import serialize_model_list

from models.tables.VehicleExtra import VehicleExtraDBTable

class VehicleAdDBModel(db.Model):

    __tablename__ = 'vehicle_ads'
    cars_folder_url_path = 'static/imgs/cars/'

    id = db.Column(db.Integer, primary_key = True)
    
    model_id = db.Column(db.Integer, db.ForeignKey('models.id'))
    model = db.relationship('ModelDBModel', lazy="joined") # Eager load.

    make_id = db.Column(db.Integer, db.ForeignKey('makes.id'))
    make = db.relationship('MakeDBModel', lazy="joined") # Eager load.

    fuel_type_id = db.Column(db.Integer, db.ForeignKey('fuel_types.id'))
    fuel_type = db.relationship('FuelTypeDBModel', lazy="joined") # Eager load.
    
    settlement_id = db.Column(db.Integer, db.ForeignKey('settlements.id'))
    settlement = db.relationship('SettlementDBModel', lazy="joined") # Eager load.

    publisher_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    publisher = db.relationship('UserDBModel', lazy="joined") # Eager load.

    car_body_configuration_id = db.Column(db.Integer, db.ForeignKey('car_body_configurations.id'))
    car_body_configuration = db.relationship('CarBodyConfigurationDBModel')

    eco_standart_id = db.Column(db.Integer, db.ForeignKey('eco_standarts.id'))
    eco_standart = db.relationship('EcoStandartDBModel')

    gearbox_id = db.Column(db.Integer, db.ForeignKey('gearboxes.id'))
    gearbox = db.relationship('GearboxDBModel', lazy="joined") # Eager load.
    
    color_id = db.Column(db.Integer, db.ForeignKey('colors.id'))
    color = db.relationship('ColorDBModel', lazy="joined") # Eager load.

    extras = db.relationship('ExtraDBModel', secondary=VehicleExtraDBTable, backref='vehicle_ads', cascade="all, delete", passive_deletes=True)

    manufacture_year = db.Column(db.Integer)
    hp = db.Column(db.Integer)
    price = db.Column(db.Float(precision=2), nullable=False)
    mileage = db.Column(db.Integer)

    modification = db.Column(db.String(20))
    description = db.Column(db.Text)
    image_names = db.Column(db.JSON())

    views = db.Column(db.Integer)
    is_approved = db.Column(db.Boolean)

    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now(), onupdate=db.func.current_timestamp())

    def __init__(self, data):

        self.update_with_form_data(data)
        
        self.views = 0

    def update_with_form_data(self, data):
        self.model_id = data['model_id']
        self.make_id = data['make_id']

        self.fuel_type_id = data['fuel_type_id']
        self.eco_standart_id = data['eco_standart_id']

        self.gearbox_id = data['gearbox_id']
        self.car_body_configuration_id = data['car_body_configuration_id']
        self.color_id = data['color_id']
        
        self.settlement_id = data['settlement_id']
        self.publisher_id = data['publisher_id']

        self.manufacture_year = data['manufacture_year']
        self.hp = data['hp']
        self.price = data['price']
        self.mileage = data['mileage']

        self.modification = data['modification']
        self.description = data['description']
        self.is_approved = data['is_approved']


    @staticmethod
    def base_image_folder() -> str:
        return os.environ['STATIC_FOLDER_PATH']  + '/imgs/cars'


    @property
    def img_folder(self):
        return self.base_image_folder() + '/' + str(self.id)

    @property
    def format_price(self):
        return format(self.price, ',.2f')

    @property
    def images_urls(self):
        return [(request.url_root + self.cars_folder_url_path + str(self.id) + '/' + name) for name in self.image_names]
        
    @property
    def current_user_is_publisher(self):
        return current_user.is_authenticated and self.publisher_id == int(current_user.get_id())

    @property
    def status(self):

        is_approved = self.is_approved

        if is_approved:
            return 'approved'
        elif is_approved == None:
            return 'pending'
        
        return 'declined'

    @property
    def extra_categories_data(self) -> dict:

        extras = {} # Stores data om format: {extra category id : [extra title 1, extra title 2]}  
        
        for extra in self.extras:
            extra_category_title = extra.extra_category.title
            
            if extra_category_title not in extras:
                extras[extra_category_title] = []
            
            extras[extra_category_title].append(extra.title)
        
        # Changes value format - from array to string joined by comma.
        return {category_title: ', '.join(extras_title) for category_title, extras_title in extras.items()}

    def serialize(self, relations=[]):

        image_names = self.image_names
        thumbnail_url = request.url_root + self.cars_folder_url_path
        
        if len(image_names) == 0:
            # if no images are uploaded, assume a default pic thumbnail. 
            thumbnail_url += '/default.png'
        else:
            # If images are uploaded assume thumbnail is the first one.
            thumbnail_url += str(self.id) + '/' + image_names[0]

        result = {
            'id': self.id,
            'make': self.make.serialize(),
            'model': self.model.serialize(),
            'fuel_type': self.fuel_type.serialize(),
            'settelment': self.settlement.serialize(),
            'publisher': self.publisher.serialize(),
            
            'modification': self.modification,
            'description': self.description,
            'manufacture_year': self.manufacture_year,
            'mileage': self.mileage,
            'price': self.format_price,
            'price_raw': self.price,
            'hp': self.hp,
            'status': self.status,

            # :-1 removes last symbol. This way we avoid double slash ('//').
            'detail_page': request.url_root[:-1] + url_for('cars_app.detail', id=self.id),
            'edit_page': request.url_root[:-1] + url_for('cars_app.update', id=self.id),
            'delete_action_url': request.url_root[:-1] + url_for('cars_app.delete', id=self.id),
            
            'thumbnail_url': thumbnail_url,
            'imsge_urls': [request.url_root + self.cars_folder_url_path + str(self.id) + '/' + name for name in image_names],

            'is_in_wishlist': False,
            
            # User has logged in and is the publisher of the ad
            'published_by_current_user': current_user.get_id() is not None and (int(current_user.get_id()) == self.publisher_id)
        }

        if 'eco_standart' in relations:
            result['eco_standart'] = self.eco_standart.serialize()

        if 'extras' in relations:
            result['extras'] = serialize_model_list(self.extras)

        if 'car_body_configuration' in relations:
            result['car_body_configuration'] = self.car_body_configuration.serialize()

        if 'gearbox' in relations:
            result['gearbox'] = self.gearbox.serialize()

        if 'color' in relations:
            result['color'] = self.color.serialize()

        return result
        