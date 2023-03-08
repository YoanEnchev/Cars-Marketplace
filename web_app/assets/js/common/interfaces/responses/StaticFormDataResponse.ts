import CarBodyConfigurationInterface from "../models/CarBodyConfigurationInterface";
import ColorInterface from "../models/ColorInterface";
import EcoStandartInterface from "../models/EcoStandartInterface";
import ExtraCategoryItemInterface from "../models/ExtraCategoryItemInterface";
import FuelInterface from "../models/FuelInterface";
import GearboxInterface from "../models/GearboxInterface";
import MakeInterface from "../models/MakeInterface";
import RegionInterface from "../models/RegionInterface";

export default interface StaticFormDataResponse {
    car_body_configuration: Array<CarBodyConfigurationInterface>,
    colors: Array<ColorInterface>,
    fuels: Array<FuelInterface>,
    eco_standarts: Array<EcoStandartInterface>,
    gearboxes: Array<GearboxInterface>,
    makes_and_models: Array<MakeInterface>,
    regions_and_settlements: Array<RegionInterface>,
    extras: Array<ExtraCategoryItemInterface>
}