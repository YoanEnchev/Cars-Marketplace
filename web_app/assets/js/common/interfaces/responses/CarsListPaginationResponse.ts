import VehicleAdInterface from "../models/VehicleAdInterface"

export default interface CarsListPaginationResponse {
    current_page: number,
    displayed_items_numercation: {
        end: number,
        start: number
    },
    items: Array<VehicleAdInterface>,
    per_page: number,
    total_pages: number,
    total_records: number
}