from injector import inject
from PIL import Image
import base64, json
from io import BytesIO

from src.repositories.VehicleAdRepository import VehicleAdRepository
from src.services.BaseModelService import BaseModelService

class VehicleAdService(BaseModelService):

    @inject
    def __init__(self, vehicle_ad_repo: VehicleAdRepository):
        self.model_repository = vehicle_ad_repo
        
    def handle_ad_action(self, form_data: dict):
        
        for index, image_url in enumerate(json.loads(form_data['image_urls'])):
            with open("imageToSave" + str(index) + ".jpg", "wb") as fh:
                starter = image_url.find(',')
                image_data = image_url[starter+1:]
                image_data = bytes(image_data, encoding="ascii")
                im = Image.open(BytesIO(base64.b64decode(image_data)))
                im.save('image.png')

