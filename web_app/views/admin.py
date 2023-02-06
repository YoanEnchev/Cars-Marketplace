from flask import Blueprint, request, url_for, abort, redirect

from services.VehicleAdService import VehicleAdService
from decorators.must_be_admin import must_be_admin


admin_app = Blueprint('admin_app', __name__, template_folder='../templates')

@admin_app.route('/admin/ads/<int:id>/approve', methods=['POST'], endpoint='approve_ad')
@must_be_admin
def approve_ad(id, vehicle_ad_service: VehicleAdService):
    vehicle_ad = vehicle_ad_service.get_by_id(id=id)
    
    if vehicle_ad is None:
        return abort(404)

    vehicle_ad_service.approve_ad(vehicle_ad)

    return redirect(url_for('cars_app.list_pending_approval_ads'))


@admin_app.route('/admin/ads/<int:id>/decline', methods=['POST'], endpoint='decline_ad')
@must_be_admin
def decline_ad(id, vehicle_ad_service: VehicleAdService):
    vehicle_ad = vehicle_ad_service.get_by_id(id=id)
    
    if vehicle_ad is None:
        return abort(404)

    vehicle_ad_service.decline_ad(vehicle_ad)

    return redirect(url_for('cars_app.list_pending_approval_ads'))