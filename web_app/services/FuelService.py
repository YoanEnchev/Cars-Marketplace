from injector import inject

from repositories.FuelTypeRepository import FuelTypeRepository
from services.BaseModelService import BaseModelService

class FuelService(BaseModelService):

    @inject
    def __init__(self, fuel_repo: FuelTypeRepository):
        self.model_repository = fuel_repo