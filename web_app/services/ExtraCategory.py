from injector import inject

from repositories.extras.ExtraCategory import ExtraCategoryRepository
from services.Base import BaseModelService

class ExtraCategoryService(BaseModelService):

    @inject
    def __init__(self, extra_category_repo: ExtraCategoryRepository):
        self.model_repository = extra_category_repo