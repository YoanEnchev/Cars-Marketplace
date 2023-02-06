from injector import inject

from repositories.EcoStandartRepository import EcoStandartRepository
from services.BaseModelService import BaseModelService

class EcoStandartService(BaseModelService):

    @inject
    def __init__(self, eco_standart_repo: EcoStandartRepository):
        self.model_repository = eco_standart_repo