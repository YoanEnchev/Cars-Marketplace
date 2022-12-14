from flask.cli import with_appcontext
from injector import inject
from faker import Faker
from run import db, main_app
import os, json, random, shutil

from src.models.User import User
from src.models.VehicleAd import VehicleAd
from src.models.Role import Role

from src.repositories.ModelRepository import ModelRepository
from src.repositories.MakeRepository import MakeRepository
from src.repositories.extras.ExtraRepository import ExtraRepository

from src.seeders.static_data import init_static_data

@main_app.cli.command('seed')
@with_appcontext
@inject
def seed():

    db.create_all() # Create tables.

    role_admin = Role({'title': 'admin'})
    db.session.add(role_admin)

    role_ordinary_user = Role({'title': 'ordinary_user'})
    db.session.add(role_ordinary_user)
    db.session.commit()
    
    user = User({'email': 'admin@admin.com', 'first_name': 'Admin', 'password': 'admin', 'phone': '08 88 888 888'})
    user.role_id = Role.ADMIN_ID
    db.session.add(user)

    fake = Faker()
    
    # Users seeding:
    for i in range(1, 10):
        user = User({'email': fake.email(), 'first_name': fake.name(), 'password': '123456', 'phone': '08 88 888 888'})
        db.session.add(user)
    
    db.session.commit()

    init_static_data()

    # Insert vehicle records based on the data.json file in each vehicle folder.
    base_cars_path = './src/commands/data/example_cars_data'

    # Delete all images generated by the seeder
    for i in range(1, 30):
        img_path = VehicleAd.base_image_folder + '/' + str(i)

        if os.path.exists(img_path):
            shutil.rmtree(img_path)

    for make in os.listdir(base_cars_path):
        make_path = base_cars_path + '/' + make
        make_obj = (MakeRepository()).get_by_make(make)

        if make_obj is None:
            raise Exception('The make ' + make + " doesn't exist.")

        for model in os.listdir(make_path):
            model_obj = (ModelRepository()).get_by_make_and_model(make_id=make_obj.id, model_title=model)
            
            if model_obj is None:
                raise Exception('The model ' + model + " doesn't exist.")
            
            if model_obj.make_id is not make_obj.id:
                raise Exception('The model is not matched by make: make=' + make + ", model=" +  model)

            for i in range(1, 3):
                car_path = make_path + '/' + model + '/' + str(i)
                
                if os.path.exists(car_path):

                    image_names = os.listdir(car_path)
                    image_names.pop() # Remove data.json file.
                    
                    if os.path.exists(car_path + '/data.json'):
                        fd = os.open(car_path + '/data.json', os.O_RDWR)
                        file_data_dict = json.loads(os.read(fd, 1000))
                        
                        vehicle_ad_obj = VehicleAd({
                            **file_data_dict,
                            **{
                                'model_id': model_obj.id,
                                'make_id': model_obj.make_id,
                                'settlement_id': random.randint(1, 1000),
                                'publisher_id': random.randint(2, 8),
                                'description': 'Lorem ipsum dolor sit amet.' * 10,
                                'is_approved': None
                            }
                        })
                        vehicle_ad_obj.is_approved = True
                        vehicle_ad_obj.extras = (ExtraRepository()).get_by_id_list([random.randint(1 + i * 3, 1 + i * 5) for i in range(10)]) # Pick random extras.
                        vehicle_ad_obj.image_names = image_names
                        
                        db.session.add(vehicle_ad_obj)
                        db.session.commit()

                        os.makedirs(vehicle_ad_obj.img_folder)
                        for name in image_names:
                            shutil.copyfile(car_path + '/' + name, vehicle_ad_obj.img_folder + '/' + name)

                    else:
                        raise Exception('Missing data.json file for ' +  car_path)