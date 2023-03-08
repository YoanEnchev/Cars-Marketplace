from injector import inject

from repositories.Gearbox import GearboxRepository
from services.Base import BaseModelService

class GearboxService(BaseModelService):

    @inject
    def __init__(self, gearbox_repo: GearboxRepository):
        self.model_repository = gearbox_repo