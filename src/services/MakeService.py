from injector import inject

from src.repositories.MakeRepository import MakeRepository
from src.services.BaseModelService import BaseModelService

class MakeService(BaseModelService):

    @inject
    def __init__(self, make_repo: MakeRepository):
        self.model_repository = make_repo