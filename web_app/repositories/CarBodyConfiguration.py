from repositories.Base import BaseRepository
from models.CarBodyConfiguration import CarBodyConfigurationDBModel

class CarBodyConfigurationRepository(BaseRepository):

    entity:object = CarBodyConfigurationDBModel