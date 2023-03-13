from typing import List
from repositories.VehicleAd import VehicleAdRepository
from models.VehicleAd import VehicleAdDBModel

default_filters = {
    'make_id': 0,
    'model_id': 0,
    'region_id': 0,
    'settlement_id': 0,
    'max_price': 0,
    'min_year': 0,
    'fuel_type_id': 0,
    'gearbox_id': 0,
    'publisher_id': 0,
    'context': ''
}

# This tests relies on the fictive records created in the fixtures.

def test_no_filter():
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100 # So all records in the DB are returned on the first page.
    ).items

    assert len(records) == 17 # All records. Nothing was filtered.

    ids: list[int] = list(map(lambda record: record.id, records))

    assert ids == list(range(17, 0, -1)) # Assume vehicle contain the same ids.

def test_make_filter():
    
    # Find VW vehicles.
    vw_records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters={**default_filters, **{'make_id': 139}}
    ).items

    vw_ids: list[int] = list(map(lambda record: record.id, vw_records))
    assert vw_ids == [17, 16, 15]


    # Find Peugeot vehicles
    peugeot_records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters={**default_filters, **{'make_id': 97}}
    ).items

    peugeot_ids = list(map(lambda record: record.id, peugeot_records))
    assert peugeot_ids == [13, 12, 11, 10, 9]

def test_model_filter():
    # Find Passat vehicles.
    passat_records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters={**default_filters, **{'model_id': 2079}}
    ).items

    vw_ids: list[int] = list(map(lambda record: record.id, passat_records))
    assert vw_ids == [16, 15]

def test_region_filter():
    # Find vehicles in Sofia (includes all Sofia prefacture towns like Botevgrad).
    sofia_records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters={**default_filters, **{'region_id': 23}}
    ).items

    sofia_ids: list[int] = list(map(lambda record: record.id, sofia_records))
    assert sofia_ids == [17, 16, 15, 14, 13]

def test_settlement_filter():
    # Find vehicles in Sofia city.
    sofia_city_records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters={**default_filters, **{'settlement_id': 4023}}
    ).items

    sofia_ids: list[int] = list(map(lambda record: record.id, sofia_city_records))
    assert sofia_ids == [14, 13]

def test_max_price_filter():
    # Find vehicles under specific price.
    vehicles_under_6000_leva_records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters={**default_filters, **{'max_price': 6000}}
    ).items

    vehicles_under_6000_leva_records_ids: list[int] = list(map(lambda record: record.id, vehicles_under_6000_leva_records))
    assert vehicles_under_6000_leva_records_ids == [15, 11]

