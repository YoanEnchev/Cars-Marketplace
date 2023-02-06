from injector import inject

from repositories.CarBodyConfigurationRepository import CarBodyConfigurationRepository
from services.BaseModelService import BaseModelService

class CarBodyConfigurationService(BaseModelService):

    @inject
    def __init__(self, car_body_configuration_repository_repo: CarBodyConfigurationRepository):
        self.model_repository = car_body_configuration_repository_repo