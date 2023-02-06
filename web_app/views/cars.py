from flask import Blueprint, render_template, request, url_for, abort, flash
from flask_login import login_required, current_user
from injector import inject
from datetime import datetime
import copy

from services.ColorService import ColorService
from services.MakeService import MakeService
from services.RegionService import RegionService
from services.FuelService import FuelService
from services.GearboxService import GearboxService
from services.EcoStandartService import EcoStandartService
from services.CarBodyConfigurationService import CarBodyConfigurationService
from services.ExtraCategoryService import ExtraCategoryService

from forms.CarAdForm import CarAdForm
from services.VehicleAdService import VehicleAdService
from decorators.must_be_admin import must_be_admin

cars_app = Blueprint('cars_app', __name__, template_folder='../templates')
vehicle_additional_relations = ['eco_standart', 'extras', 'car_body_configuration', 'gearbox', 'color']

@inject
@cars_app.route('/cars/new/', methods=['GET', 'POST'], endpoint='create')
@login_required
def create(vehicle_ad_service: VehicleAdService):
    
    if request.method == 'GET':
        return render_template('cars/create.html', current_year=datetime.utcnow().year)
    
    # POST request for car creation
    req_params = request.form
    form = CarAdForm(req_params)

    if form.validate():
        vehicle_ad_service.handle_ad_creation(req_params)
        return vehicle_ad_service.handle_successful_ad_creation()
    
    return vehicle_ad_service.handle_unsuccessful_ad_creation(req_params, form)
    

@cars_app.route('/cars/', methods=['GET'], endpoint='list_page')
def list_page():
    return render_template('cars/list.html')


@cars_app.route('/cars/my-ads', methods=['GET'], endpoint='list_my_ads')
@login_required
def list_my_ads():
    return render_template('cars/my-ads-list.html')


@cars_app.route('/cars/pending-approval', methods=['GET'], endpoint='list_pending_approval_ads')
@must_be_admin
def list_pending_approval_ads():
    return render_template('cars/pending-approval-ads.html')


@cars_app.route('/cars/data', methods=['GET'], endpoint='list_data')
def list_data(vehicle_ad_service: VehicleAdService):
    
    page = request.args.get(key='page', default=1, type=int)
    sort = request.args.get(key='sort', default='created_at_desc', type=str)

    if not vehicle_ad_service.is_valid_sort(sort):
        return {'message':'Invalid data'}, 400
    
    return vehicle_ad_service.paginated_extraction(page=page, per_page=12, filters={
        'make_id': request.args.get(key='make_id', default=0, type=int),
        'model_id': request.args.get(key='model_id', default=0, type=int),
        'region_id': request.args.get(key='region_id', default=0, type=int),
        'settlement_id': request.args.get(key='settlement_id', default=0, type=int),
        'max_price': request.args.get(key='max_price', default=0, type=float),
        'min_year': request.args.get(key='min_year', default=0, type=int),
        'fuel_type_id': request.args.get(key='fuel_type_id', default=0, type=int),
        'gearbox_id': request.args.get(key='gearbox_id', default=0, type=int),
        'publisher_id': request.args.get(key='publisher_id', default=0, type=int),
        'context': request.args.get(key='context', default='', type=str)
    }, sort=sort), 200



@cars_app.route('/cars/<int:id>', methods=['GET'], endpoint='detail')
def detail(id, vehicle_ad_service: VehicleAdService):
    
    vehicle_ad = vehicle_ad_service.get_by_id(id=id, relations=vehicle_additional_relations)
    
    if vehicle_ad is None:
        return abort(404)
    
    if not vehicle_ad.is_approved:
        if not current_user.is_authenticated:
            flash("User must be authenticated in order to view the ad that's not approved.", 'danger')
            return abort(403)

        if not (current_user.is_admin() or vehicle_ad.current_user_is_publisher):
            flash("User must be publisher or admin of the ad in order to view ad that's not approved.", 'danger')
            return abort(403)
        

    # Making clone and passing the clone into the template is used because if
    # any of the vehicle_ad properties are accessed after the update 
    # it will result in making SELECT requests for syncing object with the newest data.   
    vehicle_ad_copy = copy.deepcopy(vehicle_ad)
    vehicle_ad_service.increment_views(vehicle_ad)

    return render_template('cars/detail.html', vehicle_ad_obj=vehicle_ad_copy)


@inject
@cars_app.route('/cars/<id>/update', methods=['GET', 'POST'], endpoint='update')
def update(id, vehicle_ad_service: VehicleAdService):
    
    vehicle_ad = vehicle_ad_service.get_by_id(id=id, relations=vehicle_additional_relations)
    
    if vehicle_ad is None:
        return abort(404)

    if not vehicle_ad.current_user_is_publisher:
        flash('Only the publisher can edit the ad.', 'danger')
        return abort(403)

    if request.method == 'GET':

        return render_template('cars/edit.html', 
            vehicle_serialization=vehicle_ad.serialize(relations=vehicle_additional_relations),
            car_edit_url=url_for('cars_app.update', id=vehicle_ad.id),
            current_year=datetime.utcnow().year
        )

    req_params = request.form
    form = CarAdForm(req_params)

    if form.validate():
        vehicle_ad_service.handle_ad_update(vehicle_ad=vehicle_ad, form_data=req_params)
        return vehicle_ad_service.handle_successful_ad_update()
    
    return vehicle_ad_service.handle_unsuccessful_ad_update(form)


# Data is fetched by ajax and used for car search and create/edit form.
@inject
@cars_app.route('/cars/static-form-data', methods=['GET'], endpoint='static-data')
def car_forms_static_data(color_service: ColorService, make_service: MakeService, region_service: RegionService, fuel_service: FuelService,
    gearbox_service: GearboxService, eco_standart_service: EcoStandartService, car_body_configuration_service: CarBodyConfigurationService,
    extra_category_service: ExtraCategoryService):

    return {
        'colors': color_service.get_all(serialization=True),
        'makes_and_models': make_service.get_all(serialization=True, relations=['models']),
        'regions_and_settlements': region_service.get_all(serialization=True),
        'fuels': fuel_service.get_all(serialization=True),
        'gearboxes': gearbox_service.get_all(serialization=True),
        'eco_standarts': eco_standart_service.get_all(serialization=True),
        'car_body_configuration': car_body_configuration_service.get_all(serialization=True),
        'extras': extra_category_service.get_all(serialization=True)
    }