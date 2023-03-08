import ModelInterface from "./ModelInterface"

export default interface MakeInterface {
    id: number,
    title: string,
    models: Array<ModelInterface>
}