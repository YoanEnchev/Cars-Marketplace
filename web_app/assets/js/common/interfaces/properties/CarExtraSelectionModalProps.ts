import ExtraCategoryItemInterface from "../models/ExtraCategoryItemInterface"

export default interface CarExtraSelectionModalProps {
    onHide: Function,
    onSave: Function,
    show: boolean,
    extras: Array<ExtraCategoryItemInterface>
}