from injector import inject

from repositories.FuelType import FuelTypeRepository
from services.Base import BaseModelService

class FuelService(BaseModelService):

    @inject
    def __init__(self, fuel_repo: FuelTypeRepository):
        self.model_repository = fuel_repo