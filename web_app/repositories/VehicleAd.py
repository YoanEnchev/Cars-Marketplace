from repositories.Base import BaseRepository
from models.VehicleAd import VehicleAdDBModel
from services.helpers.serialization import serialize_model_list
from sqlalchemy import desc, asc
from flask_login import current_user

import math

class VehicleAdRepository(BaseRepository):
    
    entity:object = VehicleAdDBModel

    def paginated_extraction(self, per_page: int, page: int, filters: dict, sort: str) -> dict:

        filterList = []

        if filters['make_id'] is not 0:
            filterList.append(VehicleAdDBModel.make_id == filters['make_id'])

        if filters['model_id'] is not 0:
            filterList.append(VehicleAdDBModel.model_id == filters['model_id'])

        if filters['settlement_id'] is not 0:
            filterList.append(VehicleAdDBModel.settlement_id == filters['settlement_id'])

        if filters['max_price'] is not 0:
            filterList.append(VehicleAdDBModel.price <= filters['max_price'])

        if filters['min_year'] is not 0:
            filterList.append(VehicleAdDBModel.manufacture_year >= filters['min_year'])

        if filters['fuel_type_id'] is not 0:
            filterList.append(VehicleAdDBModel.fuel_type_id == filters['fuel_type_id'])

        if filters['gearbox_id'] is not 0:
            filterList.append(VehicleAdDBModel.gearbox_id == filters['gearbox_id'])

        if filters['publisher_id'] is not 0:
            filterList.append(VehicleAdDBModel.publisher_id == filters['publisher_id'])


        context = filters['context']
        
        # Determine the is_approved filter value.
        # Only admins are supposed to view pending approvement ads.
        if context == 'pending_approval' and current_user.is_admin():
            filterList.append(VehicleAdDBModel.is_approved == None)
        elif context == 'my_ads':
            # Don't filter ads by approved status in my ads
            pass
        else:
            filterList.append(VehicleAdDBModel.is_approved == True)


        query = self.entity \
            .query \
            .filter(*filterList)
        
        if filters['region_id'] is not 0:
            query = query.filter(VehicleAdDBModel.settlement.has(region_id=filters['region_id']))

        # Splits by last occurance of the character.
        # Example 'created_at_asc' splits into ['created_at', 'asc']
        [column, sort_direction] = sort.rsplit('_', 1)
        attribute = getattr(VehicleAdDBModel, column)

        order_by = asc(attribute)
        if sort_direction == 'desc': 
            order_by = desc(attribute)

        query = query.order_by(order_by)
        pagination = query.paginate(page=page, error_out=False, per_page=per_page)

        current_page = pagination.page

        # Indicates what are the shown items (like 21 - 30) for pagnation with 10 items per page.
        items_numeration_start = (current_page - 1) * per_page + 1
        items_numeration_end = current_page * per_page
        total_records = pagination.total

        if items_numeration_end > total_records:
            items_numeration_end = total_records

        return {
            'items': serialize_model_list(pagination.items),
            'displayed_items_numercation': {
                'start': items_numeration_start,
                'end': items_numeration_end
            },
            'total_records': total_records,
            'current_page': current_page,
            'per_page': pagination.per_page,
            'total_pages': math.ceil(total_records / per_page)
        }