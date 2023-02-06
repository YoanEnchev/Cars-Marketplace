from initializers.db import db

from models.Make import Make
from models.Color import Color
from models.CarBodyConfiguration import CarBodyConfiguration
from models.EcoStandart import EcoStandart
from models.FuelType import FuelType
from models.Gearbox import Gearbox
from models.Region import Region
from models.Settlement import Settlement
from models.Model import Model
from models.extras.ExtraCategory import ExtraCategory
from models.extras.Extra import Extra

from commands.data.makes_models import makes_models
from commands.data.extras_and_categories import extras_and_categories
from commands.data.colors import colors
from commands.data.car_body_configurations import car_body_configurations
from commands.data.eco_standarts import eco_standarts
from commands.data.fuels import fuels
from commands.data.gearboxes import gearboxes
from commands.data.regions_and_settlements import regions_and_settlements


def init_static_data():
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