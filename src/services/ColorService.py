from injector import inject

from src.repositories.ColorRepository import ColorRepository
from src.services.BaseModelService import BaseModelService

class ColorService(BaseModelService):

    @inject
    def __init__(self, color_repo: ColorRepository):
        self.model_repository = color_repo