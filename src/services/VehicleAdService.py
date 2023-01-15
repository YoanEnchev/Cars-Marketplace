from injector import inject
from PIL import Image
from io import BytesIO
from mimetypes import guess_extension, guess_type
from run import db
from flask import session, flash, redirect, url_for, Response
from flask_login import current_user
from werkzeug.datastructures import ImmutableMultiDict

from src.repositories.VehicleAdRepository import VehicleAdRepository
from src.repositories.extras.ExtraRepository import ExtraRepository
from src.services.BaseModelService import BaseModelService
from src.services.FormService import FormService
from src.models.VehicleAd import VehicleAd
from src.forms.CarAdForm import CarAdForm

import base64, json, os, shutil, pathlib

class VehicleAdService(BaseModelService):

    vehicle_creation_session_key = 'vehicle_creation'
    model_repository: VehicleAdRepository

    @inject
    def __init__(self, vehicle_ad_repo: VehicleAdRepository, form_service: FormService):
        
        self.model_repository = vehicle_ad_repo
        self.form_service = form_service

    def paginated_extraction(self, page: int, per_page: int, filters: dict, sort: str):

        return self.model_repository.paginated_extraction(page=page, per_page=per_page, filters=filters, sort=sort)
        

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

        vehicle_ad = VehicleAd(data)
        vehicle_ad.extras = (ExtraRepository()).get_by_id_list(json.loads(form_data['extras']))
        db.session.add(vehicle_ad)
        db.session.commit() # Create vehicle now so it know what id will the object have to determine image folder path.

        vehicle_ad.image_names = self.save_images_on_disk(data['image_urls'], vehicle_ad)
        db.session.add(vehicle_ad)
        db.session.commit()


    def handle_ad_update(self, vehicle_ad: VehicleAd, form_data: ImmutableMultiDict):

        shutil.rmtree(vehicle_ad.img_folder) # Delete all image files.
        vehicle_ad.image_names = self.save_images_on_disk(form_data['image_urls'], vehicle_ad)

        data = dict(form_data) # Make dict mutable.
        data['publisher_id'] = current_user.id
        data['is_approved'] = None

        vehicle_ad.update_with_form_data(data)
        vehicle_ad.extras = (ExtraRepository()).get_by_id_list(json.loads(data['extras']))
        
        db.session.add(vehicle_ad)
        db.session.commit()


    def save_images_on_disk(self, image_urls: list, vehicle_ad: VehicleAd) -> list:
        # Make sure function is called only when image folder doesn't exist.
        
        image_names = []
        img_folder = vehicle_ad.img_folder

        os.makedirs(img_folder)
        
        for index, image_url in enumerate(json.loads(image_urls)):
            
            image_extension = guess_extension(guess_type(image_url)[0]) # value like .jpg and .png
          
            # Invalid specification for image extension in data url.
            if image_extension is None:
                continue

            img_name = str(index + 1) + image_extension
            img_path = img_folder + '/' + img_name

            image_names.append(img_name)

            with open(img_path, "wb") as fh:
                starter = image_url.find(',')
                
                image_data = image_url[starter+1:]
                image_data = bytes(image_data, encoding="ascii")
                
                im = Image.open(BytesIO(base64.b64decode(image_data)))
                [width, height] = im.size
                max_dimension = 2000

                if width > max_dimension or height > max_dimension:
                    # Make sure to lower dimensions so image size is reduced.
                    im = im.resize((int(max_dimension * width / height), max_dimension))

                im.save(img_path, optimize=True, quality=75)

        return image_names

    def increment_views(self, vehicle_ad: VehicleAd):
        
        vehicle_ad.views += 1

        db.session.add(vehicle_ad)
        db.session.commit()

    def approve_ad(self, vehicle_ad: VehicleAd):
        vehicle_ad.is_approved = True

        db.session.add(vehicle_ad)
        db.session.commit()

        flash('Успешно одобряване на обява.', 'primary')


    def decline_ad(self, vehicle_ad: VehicleAd):
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

        flash(self.form_service.get_error_message(form), 'danger')
        return redirect(url_for('cars_app.create'))


    def handle_successful_ad_update(self) -> Response:
        
        flash('Успешно редактиране на обява.', 'primary')
        return redirect(url_for('cars_app.list_my_ads'))


    def handle_unsuccessful_ad_update(self, form: CarAdForm) -> Response:
        
        flash(self.form_service.get_error_message(form), 'danger')
        return redirect(url_for('home_app.home'))

    