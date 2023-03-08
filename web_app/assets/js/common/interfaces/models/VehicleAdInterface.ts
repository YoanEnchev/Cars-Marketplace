import CarBodyConfigurationInterface from "./CarBodyConfigurationInterface"
import ColorInterface from "./ColorInterface"
import EcoStandartInterface from "./EcoStandartInterface"
import ExtraCategoryItemInterface from "./ExtraCategoryItemInterface"
import FuelInterface from "./FuelInterface"
import GearboxInterface from "./GearboxInterface"
import MakeInterface from "./MakeInterface"
import ModelInterface from "./ModelInterface"
import SettlementInterface from "./SettlementInterface"
import UserInterface from "./UserInterface"

export default interface VehicleAdInterface {
    id: number,
    make: MakeInterface,
    model: ModelInterface,
    fuel_type: FuelInterface,
    settelment: SettlementInterface,
    publisher: UserInterface,
    modification: string,
    description: string,
    manufacture_year: number,
    mileage: number,
    price: string, // String is because formated: 10,000.00
    price_raw: number,
    hp: number,
    status: string,
    detail_page: string,
    edit_page: string,
    thumbnail_url: string,
    imsge_urls: Array<string>,
    is_in_wishlist: boolean,
    is_editable: boolean,
    
    // Relations:
    eco_standart?: EcoStandartInterface,
    extras?: Array<ExtraCategoryItemInterface>,
    car_body_configuration?: CarBodyConfigurationInterface,
    gearbox?: GearboxInterface,
    color?: ColorInterface
}