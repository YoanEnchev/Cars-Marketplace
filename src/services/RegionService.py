from injector import inject

from src.repositories.RegionRepository import RegionRepository
from src.services.BaseModelService import BaseModelService

class RegionService(BaseModelService):

    @inject
    def __init__(self, region_repo: RegionRepository):
        self.model_repository = region_repo