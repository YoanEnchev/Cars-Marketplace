from flask.cli import with_appcontext
from injector import inject
import os, json

from src.models.User import User
from src.models.Make import Make
from src.models.Color import Color
from src.models.CarBodyConfiguration import CarBodyConfiguration
from src.models.EcoStandart import EcoStandart
from src.models.FuelType import FuelType
from src.models.Gearbox import Gearbox
from src.models.Region import Region
from src.models.Settlement import Settlement
from src.models.VehicleAd import VehicleAd
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
def seed():

    db.create_all() # Create tables.
    fake = Faker()
    
    # Users seeding:
    for i in range(1, 4):
        user = User({'email': fake.email(), 'first_name': fake.name(), 'password': '123456'})
        db.session.add(user)
    
    #db.session.commit()

    # Makes & models seeding:
    for make_title, models_arr in makes_models.items():
        make_obj = Make({'title': make_title})
        db.session.add(make_obj)
        db.session.commit()

        for model_title in models_arr:
            model_obj = Model({'title': model_title, 'make_id': make_obj.id})
            db.session.add(model_obj)

        db.session.commit()


    # Extras seeding:
    for extra_category_title, extras_arr in extras_and_categories.items():
        extra_category_obj = ExtraCategory({'title': extra_category_title})
        db.session.add(extra_category_obj)
        db.session.commit()

        for extra_title in extras_arr:
            extra_obj = Extra({'title': extra_title, 'category_id': extra_category_obj.id})
            db.session.add(extra_obj)

        db.session.commit()


    # Colors seeding:
    for color_title in colors:
        color_obj = Color({'title': color_title})
        db.session.add(color_obj)

    db.session.commit()


    # Car body configurations seeding:
    for body_title in car_body_configurations:
        car_body_obj = CarBodyConfiguration({'title': body_title})
        db.session.add(car_body_obj)
    
    db.session.commit()


    # Eco standarts seeding:
    for standart_title in eco_standarts:
        eco_standart_obj = EcoStandart({'title': standart_title})
        db.session.add(eco_standart_obj)

    db.session.commit()


    # Fuels seeding:
    for fuel_title in fuels:
        fuel_obj = FuelType({'title': fuel_title})
        db.session.add(fuel_obj)
    
    db.session.commit()


    # Gearboxes seeding:
    for gearbox_title in gearboxes:
        gearbox_obj = Gearbox({'title': gearbox_title})
        db.session.add(gearbox_obj)
    
    db.session.commit()


    # Regions and Settlements seeding
    for region_title, settlements_arr in regions_and_settlements.items():
        region_obj = Region({'title': region_title})
        db.session.add(region_obj)
        db.session.commit()

        for settlement_title in settlements_arr:
            settlement_obj = Settlement({'title': settlement_title, 'region_id': region_obj.id})
            db.session.add(settlement_obj)

        db.session.commit()

    # Car Vehicles
    return
    base_cars_path = './src/commands/data/example_cars_data'

    for make in os.listdir(base_cars_path):
        make_path = base_cars_path + '/' + make

        for model in os.listdir(make_path):
            
            for i in range(1, 3):
                car_path = make_path + '/' + model + '/' + str(i)
                
                if os.path.exists(car_path):
                    
                    if os.path.exists(car_path + '/data.json'):
                        fd = os.open(car_path + '/data.json', os.O_RDWR)
                        content = os.read(fd, 1000)
                        print(json.loads(content))
                        #with os.open(car_path + '/data.json', 'r') as file:
                        #    print(file.read())

