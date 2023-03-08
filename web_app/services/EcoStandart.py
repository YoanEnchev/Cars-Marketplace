from injector import inject

from repositories.EcoStandart import EcoStandartRepository
from services.Base import BaseModelService

class EcoStandartService(BaseModelService):

    @inject
    def __init__(self, eco_standart_repo: EcoStandartRepository):
        self.model_repository = eco_standart_repo