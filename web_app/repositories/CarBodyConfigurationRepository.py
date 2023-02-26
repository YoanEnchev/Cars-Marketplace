from repositories.BaseRepository import BaseRepository
from models import CarBodyConfigurationDBModel

class CarBodyConfigurationRepository(BaseRepository):

    entity:object = CarBodyConfigurationDBModel