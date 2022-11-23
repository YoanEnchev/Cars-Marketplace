from flask.cli import with_appcontext
from injector import inject

from src.models.User import User
from src.models.Make import Make
from src.models.Color import Color
from src.models.CarBodyConfiguration import CarBodyConfiguration
from src.models.EcoStandart import EcoStandart
from src.models.FuelType import FuelType
from src.models.Gearbox import Gearbox
from src.models.Region import Region
from src.models.Settlement import Settlement
from src.models.Model import Model
from src.models.extras.ExtraCategory import ExtraCategory
from src.models.extras.Extra import Extra

from src.commands.data.makes_models import makes_models
from src.commands.data.extras_and_categories import extras_and_categories
from src.commands.data.colors import colors
from src.commands.data.car_body_configurations import car_body_configurations
from src.commands.data.eco_standarts import eco_standarts
from src.commands.data.fuels import fuels
from src.commands.data.gearboxes import gearboxes
from src.commands.data.regions_and_settlements import regions_and_settlements

from src.services.UserService import UserService

from faker import Faker
from run import db, main_app

@main_app.cli.command('seed')
@with_appcontext
@inject
def seed(user_service: UserService):

    db.create_all() # Create tables.
    fake = Faker()
    
    # Users seeding:
    for i in range(1, 4):
        user_service.create(data={'email': fake.email(), 'first_name': fake.name(), 'password': '123456'}, commit=(i == 3))
        #user = User({'email': fake.email(), 'first_name': fake.name(), 'password': '123456'})
        #db.session.add(user)
    
    #db.session.commit()
    return ''

    # Makes & models seeding:
    for make_title, models_arr in makes_models.items():
        make_obj = Make(make_title)
        db.session.add(make_obj)
        db.session.commit()

        for model_title in models_arr:
            model_obj = Model(model_title, make_obj.id)
            db.session.add(model_obj)

        db.session.commit()


    # Extras seeding:
    for extra_category_title, extras_arr in extras_and_categories.items():
        extra_category_obj = ExtraCategory(extra_category_title)
        db.session.add(extra_category_obj)
        db.session.commit()

        for extra_title in extras_arr:
            extra_obj = Extra(extra_title, extra_category_obj.id)
            db.session.add(extra_obj)

        db.session.commit()


    # Colors seeding:
    for color_title in colors:
        color_obj = Color(color_title)
        db.session.add(color_obj)

    db.session.commit()


    # Car body configurations seeding:
    for body_title in car_body_configurations:
        car_body_obj = CarBodyConfiguration(body_title)
        db.session.add(car_body_obj)
    
    db.session.commit()


    # Eco standarts seeding:
    for standart_title in eco_standarts:
        eco_standart_obj = EcoStandart(standart_title)
        db.session.add(eco_standart_obj)

    db.session.commit()


    # Fuels seeding:
    for fuel_title in fuels:
        fuel_obj = FuelType(fuel_title)
        db.session.add(fuel_obj)
    
    db.session.commit()


    # Gearboxes seeding:
    for gearbox_title in gearboxes:
        gearbox_obj = Gearbox(gearbox_title)
        db.session.add(gearbox_obj)
    
    db.session.commit()


    # Regions and Settlements seeding
    for region_title, settlements_arr in regions_and_settlements.items():
        region_obj = Region(region_title)
        db.session.add(region_obj)
        db.session.commit()

        for settlement_title in settlements_arr:
            settlement_obj = Settlement(settlement_title, region_obj.id)
            db.session.add(settlement_obj)

        db.session.commit()