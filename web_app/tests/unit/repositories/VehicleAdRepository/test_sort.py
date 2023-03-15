from repositories.VehicleAd import VehicleAdRepository
from models.VehicleAd import VehicleAdDBModel
from tests.unit.repositories.VehicleAdRepository.common import default_filters

def test_default_sort():
    # Sorting by default is created_at descending.
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100 # So all records in the DB are returned on the first page.
    ).items

    ids: list[int] = list(map(lambda record: record.id, records))

    assert ids == list(range(17, 0, -1)) 


def test_created_at_sort():
    # Created at - ascending sort.
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='created_at_asc'
    ).items

    ids: list[int] = list(map(lambda record: record.id, records))

    assert ids == list(range(1, 18))

    # Created at - descending sort.
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='created_at_desc'
    ).items

    ids: list[int] = list(map(lambda record: record.id, records))

    assert ids == list(range(17, 0, -1))

def test_price_sort():
    # Price - ascending sort.
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='price_asc'
    ).items

    ids: list[int] = list(map(lambda record: record.id, records))
    expected_ids: list[int] = [11, 15, 3, 2, 4, 1, 12, 5, 10, 9, 13, 6, 14, 16, 8, 7, 17]

    assert ids == expected_ids

    # Price - descending sort.

    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='price_desc'
    ).items

    ids: list[int] = list(map(lambda record: record.id, records))
    expected_ids.reverse()

    assert ids == expected_ids


def test_year_sort():
    # Year - ascending sort.
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='manufacture_year_asc'
    ).items
    
    # Years are compared instead of ids since some of the records have same years which sort is unpredictable.
    years: list[int] = list(map(lambda record: record.manufacture_year, records))
    expected_years: list[int] = [2005, 2005, 2011, 2013, 2015, 2015, 2019, 2020, 2020, 2020, 2020, 2021, 2021, 2021, 2021, 2022, 2022]
    
    assert years == expected_years
    
    # Year - descending sort.
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='manufacture_year_desc'
    ).items
    
    years: list[int] = list(map(lambda record: record.manufacture_year, records))
    expected_years.reverse()
    
    assert years == expected_years

def test_invalid_sort():
    # When invalid sort string is specified expect for the function to work as if the default sort is specified.
    expected_ids = list(range(17, 0, -1))

    # No _ symbol
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='invalid'
    ).items

    ids: list[int] = list(map(lambda record: record.id, records))

    assert ids == expected_ids

    # Invalid column
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='invalid_col_asc'
    ).items
    
    ids: list[int] = list(map(lambda record: record.id, records))

    assert ids == expected_ids

    # Invalid order
    records: list[VehicleAdDBModel] = (VehicleAdRepository()).paginated_extraction(
        filters=default_filters,
        per_page=100, # So all records in the DB are returned on the first page.
        sort='created_at_invalid'
    ).items
    
    ids: list[int] = list(map(lambda record: record.id, records))

    assert ids == expected_ids
