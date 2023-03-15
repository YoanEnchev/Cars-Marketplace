from repositories.Base import BaseRepository
from models.VehicleAd import VehicleAdDBModel
from sqlalchemy import desc, asc
from flask_login import current_user
from flask_sqlalchemy.pagination import Pagination

default_sort_col = 'created_at'
default_sort_order = 'desc'

class VehicleAdRepository(BaseRepository):
    
    entity:object = VehicleAdDBModel

    def paginated_extraction(self, per_page: int=12, page: int=1, filters: dict={}, sort: str='{default_sort_col}_{default_sort_order}') -> Pagination:

        filterList = []

        if filters['make_id'] != 0:
            filterList.append(VehicleAdDBModel.make_id == filters['make_id'])

        if filters['model_id'] != 0:
            filterList.append(VehicleAdDBModel.model_id == filters['model_id'])

        if filters['settlement_id'] != 0:
            filterList.append(VehicleAdDBModel.settlement_id == filters['settlement_id'])

        if filters['max_price'] != 0:
            filterList.append(VehicleAdDBModel.price <= filters['max_price'])

        if filters['min_year'] != 0:
            filterList.append(VehicleAdDBModel.manufacture_year >= filters['min_year'])

        if filters['fuel_type_id'] != 0:
            filterList.append(VehicleAdDBModel.fuel_type_id == filters['fuel_type_id'])

        if filters['gearbox_id'] != 0:
            filterList.append(VehicleAdDBModel.gearbox_id == filters['gearbox_id'])

        if filters['publisher_id'] != 0:
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
        
        if filters['region_id'] != 0:
            query = query.filter(VehicleAdDBModel.settlement.has(region_id=filters['region_id']))

        # Splits by last occurance of the character.
        sort_args = sort.rsplit('_', 1)
        if len(sort_args) < 2:
            # Invalid sort argument is passed. So make it work the same as the default sort.
            sort_args = [default_sort_col, default_sort_order]

        # Example 'created_at_asc' splits into ['created_at', 'asc']
        [column, sort_direction] = sort_args

        # If column or direction is invalid - make it work the same as the default sort.
        if column not in ['created_at', 'price', 'manufacture_year'] or sort_direction not in ['asc', 'desc']:
            [column, sort_direction] = [default_sort_col, default_sort_order]

        attribute = getattr(VehicleAdDBModel, column)

        order_by = asc(attribute)
        if sort_direction == 'desc': 
            order_by = desc(attribute)

        query = query.order_by(order_by)
        pagination = query.paginate(page=page, error_out=False, per_page=per_page)

        return pagination