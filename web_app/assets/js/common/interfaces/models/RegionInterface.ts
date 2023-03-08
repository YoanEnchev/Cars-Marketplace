import SettlementInterface from "./SettlementInterface"

export default interface RegionInterface {
    id: number,
    title: string,
    settlements: Array<SettlementInterface>
}