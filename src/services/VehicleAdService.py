from injector import inject

from src.repositories.VehicleAdRepository import VehicleAdRepository
from src.services.BaseModelService import BaseModelService

class VehicleAdService(BaseModelService):

    @inject
    def __init__(self, vehicle_ad_repo: VehicleAdRepository):
        self.model_repository = vehicle_ad_repo
        
    def handle_ad_action(form_data: dict):
        pass