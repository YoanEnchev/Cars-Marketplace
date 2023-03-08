import ExtraCategoryItemInterface from "./ExtraCategoryItemInterface";

export default interface ExtraCategoryInterface {
    id: number,
    title: string,
    region_id: number,
    items: Array<ExtraCategoryItemInterface>
}