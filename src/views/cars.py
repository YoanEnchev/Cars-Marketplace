from flask import Blueprint, render_template, request
from injector import inject

from src.services.ColorService import ColorService
from src.services.MakeService import MakeService
from src.services.RegionService import RegionService
from src.services.FuelService import FuelService
from src.services.GearboxService import GearboxService
from src.services.EcoStandartService import EcoStandartService
from src.services.CarBodyConfigurationService import CarBodyConfigurationService
from src.services.ExtraCategoryService import ExtraCategoryService
from src.services.FormService import FormService

from src.forms.CarAdForm import CarAdForm

cars_app = Blueprint('cars_app', __name__, template_folder='../templates')

@inject
@cars_app.route('/cars/new/', methods=['GET', 'POST'], endpoint='create')
def create(form_service: FormService):
    if request.method == 'GET':
        return render_template('cars/create.html')
    
    # POST request for car creation
    req_params = request.form
    form = CarAdForm(req_params)
    print('############################')
    print(req_params['extras'][1])
    print('--------------------------')
    print(req_params['extras'])
    print('.............................')
    print(type(req_params['extras']))
    print('^^^^^^^^^^^^^^')
    if form.validate():
        return 'valid'
    
    return 'invalid: ' + form_service.get_error_message(form)
    

@cars_app.route('/cars', methods=['GET'], endpoint='list')
def list():
    return render_template('cars/list.html')

@cars_app.route('/cars/<id>', methods=['GET'], endpoint='detail')
def detail(id):
    return render_template('cars/detail.html')

# Data is fetched by ajax and used for car search and create/edit form.
@inject
@cars_app.route('/cars/static-form-data', methods=['GET'], endpoint='static-data')
def car_forms_static_data(color_service: ColorService, make_service: MakeService, region_service: RegionService, fuel_service: FuelService,
    gearbox_service: GearboxService, eco_standart_service: EcoStandartService, car_body_configuration_service: CarBodyConfigurationService,
    extra_category_service: ExtraCategoryService):

    return {
        'colors': color_service.get_all(serialization=True),
        'makes_and_models': make_service.get_all(serialization=True),
        'regions_and_settlements': region_service.get_all(serialization=True),
        'fuels': fuel_service.get_all(serialization=True),
        'gearboxes': gearbox_service.get_all(serialization=True),
        'eco_standarts': eco_standart_service.get_all(serialization=True),
        'car_body_configuration': car_body_configuration_service.get_all(serialization=True),
        'extras': extra_category_service.get_all(serialization=True)
    }