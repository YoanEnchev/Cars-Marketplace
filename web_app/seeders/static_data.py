from initializers import db

from models import MakeDBModel, ColorDBModel, CarBodyConfigurationDBModel, EcoStandartDBModel, FuelTypeDBModel, GearboxDBModel, RegionDBModel, SettlementDBModel, ModelDBModel
from models.extras import ExtraDBModel, ExtraCategoryDBModel

from commands.data import makes_models, extras_and_categories, colors, car_body_configurations, eco_standarts, fuels, gearboxes, regions_and_settlements


def init_static_data():
    # Makes & models seeding:
    for make_title, models_arr in makes_models.items():
        make_obj = MakeDBModel({'title': make_title})
        db.session.add(make_obj)
        db.session.commit()

        for model_title in models_arr:
            model_obj = ModelDBModel({'title': model_title, 'make_id': make_obj.id})
            db.session.add(model_obj)

        db.session.commit()


    # Extras seeding:
    for extra_category_title, extras_arr in extras_and_categories.items():
        extra_category_obj = ExtraCategoryDBModel({'title': extra_category_title})
        db.session.add(extra_category_obj)
        db.session.commit()

        for extra_title in extras_arr:
            extra_obj = ExtraDBModel({'title': extra_title, 'category_id': extra_category_obj.id})
            db.session.add(extra_obj)

        db.session.commit()


    # Colors seeding:
    for color_title in colors:
        color_obj = ColorDBModel({'title': color_title})
        db.session.add(color_obj)

    db.session.commit()


    # Car body configurations seeding:
    for body_title in car_body_configurations:
        car_body_obj = CarBodyConfigurationDBModel({'title': body_title})
        db.session.add(car_body_obj)
    
    db.session.commit()


    # Eco standarts seeding:
    for standart_title in eco_standarts:
        eco_standart_obj = EcoStandartDBModel({'title': standart_title})
        db.session.add(eco_standart_obj)

    db.session.commit()


    # Fuels seeding:
    for fuel_title in fuels:
        fuel_obj = FuelTypeDBModel({'title': fuel_title})
        db.session.add(fuel_obj)
    
    db.session.commit()


    # Gearboxes seeding:
    for gearbox_title in gearboxes:
        gearbox_obj = GearboxDBModel({'title': gearbox_title})
        db.session.add(gearbox_obj)
    
    db.session.commit()


    # Regions and Settlements seeding
    for region_title, settlements_arr in regions_and_settlements.items():
        region_obj = RegionDBModel({'title': region_title})
        db.session.add(region_obj)
        db.session.commit()

        for settlement_title in settlements_arr:
            settlement_obj = SettlementDBModel({'title': settlement_title, 'region_id': region_obj.id})
            db.session.add(settlement_obj)

        db.session.commit()