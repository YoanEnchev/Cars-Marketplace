from injector import inject

from src.repositories.FuelTypeRepository import FuelTypeRepository
from src.services.BaseModelService import BaseModelService

class FuelService(BaseModelService):

    @inject
    def __init__(self, fuel_repo: FuelTypeRepository):
        self.model_repository = fuel_repo