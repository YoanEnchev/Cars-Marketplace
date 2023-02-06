from injector import inject

from repositories.GearboxRepository import GearboxRepository
from services.BaseModelService import BaseModelService

class GearboxService(BaseModelService):

    @inject
    def __init__(self, gearbox_repo: GearboxRepository):
        self.model_repository = gearbox_repo