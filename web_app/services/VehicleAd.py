from injector import inject
from PIL import Image
from io import BytesIO
from mimetypes import guess_extension, guess_type
from flask import session, flash, redirect, url_for, Response
from flask_login import current_user
from werkzeug.datastructures import ImmutableMultiDict

from repositories.VehicleAd import VehicleAdRepository
from repositories.extras.Extra import ExtraRepository

from services.Base import BaseModelService
from services.Form import FormService
from services.Color import ColorService
from services.Make import MakeService
from services.Region import RegionService
from services.Fuel import FuelService
from services.Gearbox import GearboxService
from services.EcoStandart import EcoStandartService
from services.CarBodyConfiguration import CarBodyConfigurationService
from services.ExtraCategory import ExtraCategoryService
from helpers.serialization import serialize_model_list
from helpers.delete_shutil_file import del_rw

from helpers.database import db
from helpers.redis import redis_manager

from models.VehicleAd import VehicleAdDBModel
from forms.Car import CarAdForm

import base64, json, os, shutil, math

class VehicleAdService(BaseModelService):

    vehicle_creation_session_key = 'vehicle_creation'
    static_form_data_key = 'cars_static_form_data'

    model_repository: VehicleAdRepository

    @inject
    def __init__(self, vehicle_ad_repo: VehicleAdRepository, form_service: FormService, color_service: ColorService, make_service: MakeService, region_service: RegionService, 
                fuel_service: FuelService, gearbox_service: GearboxService, eco_standart_service: EcoStandartService, car_body_configuration_service: CarBodyConfigurationService,
                extra_category_service: ExtraCategoryService):
        
        self.model_repository = vehicle_ad_repo
        self.form_service = form_service

        self.color_service = color_service
        self.make_service = make_service
        self.region_service = region_service
        self.fuel_service = fuel_service
        self.gearbox_service = gearbox_service
        self.eco_standart_service = eco_standart_service
        self.car_body_configuration_service = car_body_configuration_service
        self.extra_category_service = extra_category_service

    def paginated_extraction(self, page: int, per_page: int, filters: dict, sort: str) -> object:
        
        pagination = self.model_repository.paginated_extraction(page=page, per_page=per_page, filters=filters, sort=sort)
        
        current_page = pagination.page

        # Indicates what are the shown items (like 21 - 30) for pagnation with 10 items per page.
        items_numeration_start = (current_page - 1) * per_page + 1
        items_numeration_end = current_page * per_page
        total_records = pagination.total

        if items_numeration_end > total_records:
            items_numeration_end = total_records
        
        return {
            'items': serialize_model_list(pagination.items),
            'displayed_items_numercation': {
                'start': items_numeration_start,
                'end': items_numeration_end
            },
            'total_records': total_records,
            'current_page': current_page,
            'per_page': pagination.per_page,
            'total_pages': math.ceil(total_records / per_page)
        }


    def is_valid_sort(self, sort: str):
        # Splits by last occurance of the character.
        # Example 'created_at_asc' splits into ['created_at', 'asc']
        [column, sort] = sort.rsplit('_', 1)

        if column not in ['created_at', 'price', 'manufacture_year']:
            return False

        return sort in ['asc', 'desc']

        
    def handle_ad_creation(self, form_data: ImmutableMultiDict):

        data = dict(form_data) # Make dict mutable.
        data['publisher_id'] = current_user.id
        data['is_approved'] = None

        vehicle_ad = VehicleAdDBModel(data)
        vehicle_ad.extras = (ExtraRepository()).get_by_id_list(json.loads(form_data['extras']))
        db.session.add(vehicle_ad)
        db.session.commit() # Create vehicle now so it know what id will the object have to determine image folder path.

        vehicle_ad.image_names = self.save_images_on_disk(data['image_urls'], vehicle_ad)
        db.session.add(vehicle_ad)
        db.session.commit()


    def handle_ad_update(self, vehicle_ad: VehicleAdDBModel, form_data: ImmutableMultiDict):

        # Delete all image files.
        shutil.rmtree(vehicle_ad.img_folder, ignore_errors=False, onerror=del_rw) # onerror handles deletion of files which were generated via the flask seeding command.
        vehicle_ad.image_names = self.save_images_on_disk(form_data['image_urls'], vehicle_ad)

        data = dict(form_data) # Make dict mutable.
        data['publisher_id'] = current_user.id
        data['is_approved'] = None

        vehicle_ad.update_with_form_data(data)
        vehicle_ad.extras = (ExtraRepository()).get_by_id_list(json.loads(data['extras']))
        
        db.session.add(vehicle_ad)
        db.session.commit()


    def save_images_on_disk(self, image_urls: list, vehicle_ad: VehicleAdDBModel) -> list:
        # Make sure function is called only when image folder doesn't exist.
        
        image_names = []
        img_folder = vehicle_ad.img_folder

        os.makedirs(img_folder)
        
        for index, image_url in enumerate(json.loads(image_urls)):
            
            image_extension = guess_extension(guess_type(image_url)[0])[1:] # guess_extension returns value like .jpg and .png and afterwards we drop the first symbol - '.'. 

            if image_extension not in ['jpg', 'jpeg', 'png', 'gif', 'webp', 'apng', 'avif', 'jfif', 'pjpeg', 'pjp', 'webp', 'tif', 'tiff']:
                # Invalid specification for image extension in data url.
                continue

            img_name = str(index + 1) + '.' + image_extension
            img_path = img_folder + '/' + img_name

            with open(img_path, "wb") as fh:
                starter = image_url.find(',')
                
                image_data = image_url[starter+1:]
                image_data = bytes(image_data, encoding="ascii")
                
                im = None
                try:
                    im = Image.open(BytesIO(base64.b64decode(image_data)))
                except:
                    continue

                [width, height] = im.size
                max_dimension = 2000

                if width > max_dimension or height > max_dimension:
                    # Make sure to lower dimensions so image size is reduced.
                    im = im.resize((int(max_dimension * width / height), max_dimension))

                im.save(img_path, optimize=True, quality=75)
                image_names.append(img_name)

        return image_names
    
    def get_static_form_data(self) -> dict:
        
        static_form_data = redis_manager.get(self.static_form_data_key)
    
        if static_form_data:
            return static_form_data
    
        data_to_extract = {
            'colors': self.color_service.get_all(serialization=True),
            'makes_and_models': self.make_service.get_all(serialization=True, relations=['models']),
            'regions_and_settlements': self.region_service.get_all(serialization=True),
            'fuels': self.fuel_service.get_all(serialization=True),
            'gearboxes': self.gearbox_service.get_all(serialization=True),
            'eco_standarts': self.eco_standart_service.get_all(serialization=True),
            'car_body_configuration': self.car_body_configuration_service.get_all(serialization=True),
            'extras': self.extra_category_service.get_all(serialization=True)
        }
        
        redis_manager.set(self.static_form_data_key, json.dumps(data_to_extract)) # Convert to string before saving
        
        return data_to_extract

    def increment_views(self, vehicle_ad: VehicleAdDBModel):
        
        vehicle_ad.views += 1

        db.session.add(vehicle_ad)
        db.session.commit()

    def approve_ad(self, vehicle_ad: VehicleAdDBModel):
        vehicle_ad.is_approved = True

        db.session.add(vehicle_ad)
        db.session.commit()

        flash('Успешно одобряване на обява.', 'primary')


    def decline_ad(self, vehicle_ad: VehicleAdDBModel):
        vehicle_ad.is_approved = False

        db.session.add(vehicle_ad)
        db.session.commit()

        flash('Успешно отказване на обява.', 'primary')

    def handle_successful_ad_creation(self) -> Response:

        if session.get(self.vehicle_creation_session_key):
             session.pop(self.vehicle_creation_session_key) # No need to store form values if form is valid and operation succeeds.

        flash('Успешно създаване на обява.', 'primary')
        return redirect(url_for('cars_app.list_my_ads'))


    def handle_unsuccessful_ad_creation(self, form_data: dict, form: CarAdForm) -> Response:
        
        session[self.vehicle_creation_session_key] = form_data # Set form field values so they are restored for form.

        # Alternative to the message: self.form_service.get_error_message(form),
        flash('Неправилно попълнени данни.' ,'danger')
        return redirect(url_for('cars_app.create'))


    def handle_successful_ad_update(self) -> Response:
        
        flash('Успешно редактиране на обява.', 'primary')
        return redirect(url_for('cars_app.list_my_ads'))


    def handle_unsuccessful_ad_update(self, form: CarAdForm) -> Response:
        
        # Alternative to the message: self.form_service.get_error_message(form)
        flash('Неправилно попълнени данни.', 'danger')
        return redirect(url_for('home_app.home'))
    

    def handle_successful_ad_delete(self, entity_object: VehicleAdDBModel, flush: bool = False) -> Response:
        
        self.model_repository.permanent_delete(entity_object, flush)

        flash('Успешно изтриванe на обява.', 'primary')
        return redirect(url_for('cars_app.list_my_ads'))

    