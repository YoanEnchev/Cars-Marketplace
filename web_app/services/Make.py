from injector import inject

from repositories.Make import MakeRepository
from services.Base import BaseModelService

class MakeService(BaseModelService):

    @inject
    def __init__(self, make_repo: MakeRepository):
        self.model_repository = make_repo