from injector import inject

from src.repositories.extras.ExtraCategoryRepository import ExtraCategoryRepository
from src.services.BaseModelService import BaseModelService

class ExtraCategoryService(BaseModelService):

    @inject
    def __init__(self, extra_category_repo: ExtraCategoryRepository):
        self.model_repository = extra_category_repo