from injector import inject

from repositories.Region import RegionRepository
from services.Base import BaseModelService

class RegionService(BaseModelService):

    @inject
    def __init__(self, region_repo: RegionRepository):
        self.model_repository = region_repo