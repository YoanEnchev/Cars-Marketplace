from injector import inject
from PIL import Image
from io import BytesIO
from mimetypes import guess_extension, guess_type
from run import db
from flask import session, flash, redirect, url_for, Response
from flask_login import current_user

from src.repositories.VehicleAdRepository import VehicleAdRepository
from src.repositories.extras.ExtraRepository import ExtraRepository
from src.services.BaseModelService import BaseModelService
from src.models.VehicleAd import VehicleAd
from src.forms.CarAdForm import CarAdForm

import base64, json, os, shutil

class VehicleAdService(BaseModelService):

    vehicle_creation_session_key = 'vehicle_creation'

    @inject
    def __init__(self, vehicle_ad_repo: VehicleAdRepository, extra_repo: ExtraRepository):
        
        self.model_repository = vehicle_ad_repo
        

    def handle_ad_creation(self, form_data: dict):

        form_data['publisher_id'] = current_user.id
        vehicle_ad = VehicleAd(form_data)
        vehicle_ad.extras = (ExtraRepository()).get_by_id_list(form_data['extras'])
        db.session.add(vehicle_ad)
        db.session.commit() # Create vehicle now so it know what id will the object have to determine image folder path.

        os.mkdir(vehicle_ad.img_folder)
        vehicle_ad.image_names = self.save_images_on_disk(form_data['image_urls'], vehicle_ad)
        db.session.add(vehicle_ad)
        db.session.commit()


    def handle_ad_update(self, vehicle_ad: VehicleAd, form_data: dict):

        shutil.rmtree(vehicle_ad.img_folder) # Delete all image files.
        vehicle_ad.image_names = self.save_images_on_disk(form_data['image_urls'], vehicle_ad)

        vehicle_ad.update_with_form_data(form_data)
        vehicle_ad.extras = (ExtraRepository()).get_by_id_list(form_data['extras'])
        
        db.session.add(vehicle_ad)
        db.session.commit()


    def save_images_on_disk(image_urls: list, vehicle_ad: VehicleAd) -> list:

        image_names = []
        
        for index, image_url in enumerate(json.loads(image_urls)):
            
            image_extension = guess_extension(guess_type(image_url)[0]) # value like .jpg and .png
            img_name = str(index) + image_extension
            img_path = vehicle_ad.img_folder + '/' + img_name

            image_names.append(img_name)

            with open(img_path, "wb") as fh:
                starter = image_url.find(',')
                
                image_data = image_url[starter+1:]
                image_data = bytes(image_data, encoding="ascii")
                
                im = Image.open(BytesIO(base64.b64decode(image_data)))
                im.save(img_path)

        return image_names


    def handle_successful_ad_creation(self) -> Response:

        if session.get(self.vehicle_creation_session_key):
             session.pop(self.vehicle_creation_session_key) # No need to store form values if form is valid and operation succeeds.

        flash('Успешно създаване на обява.', 'primary')
        return redirect(url_for('home_app.home'))


    def handle_unsuccessful_ad_creation(self, form_data: dict, form: CarAdForm) -> Response:
        
        session[self.vehicle_creation_session_key] = form_data # Set form field values so they are restored for form.

        flash(self.form_service.get_error_message(form), 'danger')
        return redirect(url_for('cars_app.create'))


    def handle_successful_ad_update(self) -> Response:
        
        flash('Успешно редактиране на обява.', 'primary')
        return redirect(url_for('home_app.home'))


    def handle_unsuccessful_ad_update(self, form: CarAdForm) -> Response:
        
        flash(self.form_service.get_error_message(form), 'danger')
        return redirect(url_for('home_app.home'))