from injector import inject

from repositories.Color import ColorRepository
from services.Base import BaseModelService

class ColorService(BaseModelService):

    @inject
    def __init__(self, color_repo: ColorRepository):
        self.model_repository = color_repo