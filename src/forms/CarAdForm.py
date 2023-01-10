from wtforms import Form, IntegerField, StringField, DecimalField
from wtforms.validators import DataRequired, Length, NumberRange, ValidationError
from datetime import date
import json

from src.repositories.ModelRepository import ModelRepository
from src.repositories.FuelTypeRepository import FuelTypeRepository
from src.repositories.EcoStandartRepository import EcoStandartRepository
from src.repositories.GearboxRepository import GearboxRepository
from src.repositories.CarBodyConfigurationRepository import CarBodyConfigurationRepository
from src.repositories.ColorRepository import ColorRepository
from src.repositories.RegionRepository import RegionRepository
from src.repositories.SettlementRepository import SettlementRepository


def validate_model(self, field):
    model = (ModelRepository()).get_by_id(id=field.data) 

    if model == None:
        raise ValidationError('Invalid model.')

    if model.make_id is not self.make_id.data:
        raise ValidationError('Model not matching make.')

def validate_fuel(self, field):
    if (FuelTypeRepository()).get_by_id(id=field.data) == None:
        raise ValidationError('Invalid fuel.')

def validate_eurostandart(self, field):
    if (EcoStandartRepository()).get_by_id(id=field.data) == None:
        raise ValidationError('Invalid eco standart.')

def validate_gearbox(self, field):
    if (GearboxRepository()).get_by_id(id=field.data) == None:
        raise ValidationError('Invalid gearbox.')

def validate_car_body_configuration(self, field):
    if (CarBodyConfigurationRepository()).get_by_id(id=field.data) == None:
        raise ValidationError('Invalid car body configuration.')

def validate_color(self, field):
    if (ColorRepository()).get_by_id(id=field.data) == None:
        raise ValidationError('Invalid color.')

def validate_region(self, field):
    if (RegionRepository()).get_by_id(id=field.data) == None:
        raise ValidationError('Invalid region.')

def validate_settlement(self, field):
    settlement = (SettlementRepository()).get_by_id(id=field.data)

    if settlement == None:
        raise ValidationError('Invalid settlement.')

    if settlement.region_id != self.region_id.data:
         raise ValidationError('Settlement does not match region.')

def validate_extras(self, field):
    
    extras = []
    
    try:
        extras = json.loads(field.data)
    except ValueError as e:
        raise ValidationError('Extras parameter is not a valid JSON.')
    
    if type(extras) is not list:
        raise ValidationError("Extras need to be array.")

    for extraID in extras:
        if type(extraID) is not int:
            raise ValidationError('Not all elements of the extras array are numeric.')

    # Don't validate here if the extras ids correspond to real record.
    # This is done in other service which sets records.

def validate_image_urls(self, field):
    
    image_urls = []
    
    try:
        image_urls = json.loads(field.data)
    except ValueError as e:
        raise ValidationError('Image urls parameter is not a valid JSON.')
    
    if type(image_urls) is not list:
        raise ValidationError('Image urls need to be array.')
    
    for image_url in image_urls:
        if type(image_url) is not str:
            raise ValidationError('Not all elements of the image urls array are numeric.')

        # Upload image size must be below 50 MB.
        if (len(image_url) * 3 / 4 - image_url.count('=', -2)) / (1024 * 1024) > 50 + 1: # +1 just to make sure size is not underestimated.
            raise ValidationError('Images above 50 MB are not allowed.')
        


class CarAdForm(Form):
    make_id = IntegerField('Make', [DataRequired()])
    model_id = IntegerField('Model', [DataRequired(), validate_model])
    modification = StringField('Modification', [DataRequired(), Length(min=3, max=20)])
    fuel_type_id = IntegerField('Fuel', [DataRequired(), validate_fuel])

    eco_standart_id = IntegerField('Eco Standart', [DataRequired(), validate_eurostandart])
    gearbox_id = IntegerField('Gearbox', [DataRequired(), validate_gearbox])
    car_body_configuration_id = IntegerField('Car Body Configuration', [DataRequired(), validate_car_body_configuration])
    color_id = IntegerField('Color', [DataRequired(), validate_color])

    price = DecimalField('Price', [DataRequired(), NumberRange(min=1, max=100_000_000)])
    hp = IntegerField('HP', [DataRequired(), NumberRange(min=1, max=10000)])
    manufacture_year = IntegerField('Manufacture Year', [DataRequired(), NumberRange(min=1900, max=date.today().year)])
    mileage = IntegerField('Mileage', [DataRequired(), NumberRange(min=0, max=50_000_000)])

    region_id = IntegerField('Region', [DataRequired(), validate_region])
    settlement_id = IntegerField('Settlement', [DataRequired(), validate_settlement])

    description = StringField('Description', [Length(max=500)])
    extras = StringField('Extras', [DataRequired(), Length(max=1000), validate_extras])

    image_urls = StringField('Image Urls', [DataRequired(), validate_image_urls])