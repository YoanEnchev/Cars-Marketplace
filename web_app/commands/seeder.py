from flask.cli import with_appcontext
from injector import inject
from faker import Faker

from app import main_app
from helpers.database import db

import os, json, random, shutil

from models.User import UserDBModel
from models.VehicleAd import VehicleAdDBModel
from models.Role import RoleDBModel

from repositories.Model import ModelRepository
from repositories.Make import MakeRepository
from repositories.extras.Extra import ExtraRepository

from seeders.static_data import init_static_data

def seed_fictive_records():
    role_admin = RoleDBModel({'title': 'admin'})
    db.session.add(role_admin)

    role_ordinary_user = RoleDBModel({'title': 'ordinary_user'})
    db.session.add(role_ordinary_user)
    db.session.commit()
    
    user = UserDBModel({'email': 'admin@admin.com', 'first_name': 'Admin', 'password': 'admin', 'phone': '08 88 888 888'})
    user.role_id = RoleDBModel.ADMIN_ID
    db.session.add(user)

    fake = Faker()
    
    # Users seeding:
    # We specify emails here they are known when testing.
    for email in ['thfhthth@rackabzar.com', 'aleiki@onlinecmail.com', 'daveb316@greendike.com', 'evgenijkulinchenko@otpku.com', 'rkoehler@infosol.me', 'msn01@oxford-edu.cf', 'agaff1@asifboot.com', 'nkotke@onosyaikh.com', 'lidoandoliver@hulas.me', 'dragooi@getcashstash.com']:
        loopUser = UserDBModel({'email': email, 'first_name': fake.name(), 'password': '123456', 'phone': '08 88 888 888'})
        db.session.add(loopUser)
    
    db.session.commit()

    init_static_data()

    # Insert vehicle records based on the data.json file in each vehicle folder.
    base_cars_path = './commands/data/example_cars_data'

    # Delete all images generated by the seeder
    for i in range(1, 30):
        img_path = VehicleAdDBModel.base_image_folder() + '/' + str(i)

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
                    image_names.sort()
                    image_names.pop() # Remove data.json file.
                    
                    if os.path.exists(car_path + '/data.json'):
                        fd = os.open(car_path + '/data.json', os.O_RDWR)
                        file_data_dict = json.loads(os.read(fd, 1000))
                        
                        vehicle_ad_obj = VehicleAdDBModel({
                            **file_data_dict,
                            **{
                                'model_id': model_obj.id,
                                'make_id': model_obj.make_id,
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

                        # Files created via command cannot be edited afterwards when using the app.
                        os.chmod(vehicle_ad_obj.img_folder, 0o777) 
                        for name in image_names:
                            destination = vehicle_ad_obj.img_folder + '/' + name
                            shutil.copyfile(car_path + '/' + name, destination)
                            os.chmod(destination, 0o777) 

                    else:
                        raise Exception('Missing data.json file for ' +  car_path)


@main_app.cli.command('seed')
@with_appcontext
@inject
def seed():

    db.create_all() # Create tables.
    seed_fictive_records()