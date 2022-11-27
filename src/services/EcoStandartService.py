from injector import inject

from src.repositories.EcoStandartRepository import EcoStandartRepository
from src.services.BaseModelService import BaseModelService

class EcoStandartService(BaseModelService):

    @inject
    def __init__(self, eco_standart_repo: EcoStandartRepository):
        self.model_repository = eco_standart_repo