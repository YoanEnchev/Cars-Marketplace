from src.repositories.BaseRepository import BaseRepository
from src.models.VehicleAd import VehicleAd
from src.services.helpers.serialize_model_list import serialize_model_list

import math

class VehicleAdRepository(BaseRepository):
    
    entity:object = VehicleAd

    def paginated_extraction(self, per_page: int, page: int, filters: dict, sort: str) -> dict:
        #.filter_by()

        # Notice if 
        pagination = self.entity.query \
            .paginate(page=page, error_out=False, per_page=per_page)

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