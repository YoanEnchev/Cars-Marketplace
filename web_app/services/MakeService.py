from injector import inject

from repositories.MakeRepository import MakeRepository
from services.BaseModelService import BaseModelService

class MakeService(BaseModelService):

    @inject
    def __init__(self, make_repo: MakeRepository):
        self.model_repository = make_repo