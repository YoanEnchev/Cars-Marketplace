import VehicleAdInterface from "../models/VehicleAdInterface"

export default interface CarAdFormProps {
    staticFormDataUrl: URL, 
    vehicleParams?: VehicleAdInterface, 
    actionUrl: string,
    buttonText: string,
    currentYear: number
}