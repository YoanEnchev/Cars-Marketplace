from injector import inject

from src.repositories.GearboxRepository import GearboxRepository
from src.services.BaseModelService import BaseModelService

class GearboxService(BaseModelService):

    @inject
    def __init__(self, gearbox_repo: GearboxRepository):
        self.model_repository = gearbox_repo