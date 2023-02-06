export default function formatAsOptionData(array, valueProp, labelProp) {
    return array.map(elem => ({
        value: elem[valueProp],
        label: elem[labelProp],
    }))
}