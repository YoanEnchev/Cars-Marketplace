from injector import inject

from repositories.ColorRepository import ColorRepository
from services.BaseModelService import BaseModelService

class ColorService(BaseModelService):

    @inject
    def __init__(self, color_repo: ColorRepository):
        self.model_repository = color_repo