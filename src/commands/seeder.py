from flask.cli import with_appcontext

from src.models.User import User
from src.models.Make import Make
from src.models.Color import Color
from src.models.Model import Model
from src.models.extras.ExtraCategory import ExtraCategory
from src.models.extras.Extra import Extra
from src.models.Model import Model

from src.commands.data.makes_models import makes_models
from src.commands.data.extras_and_categories import extras_and_categories
from src.commands.data.colors import colors

from faker import Faker
from run import db, main_app

@main_app.cli.command('seed')
@with_appcontext
def seed():

    db.create_all() # Create tables.
    fake = Faker()
    
    # Users seeding:
    
    for i in range(1, 4):
        user = User(email=fake.email(), first_name=fake.name(), password='123456')
        db.session.add(user)
    
    db.session.commit()


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


    # Color seeding:
    for color_title in colors:
        color_obj = Color(color_title)
        db.session.add(color_obj)



