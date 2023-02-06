import React, {useState, useEffect} from 'react'
import renderColumnFields from '../../helpers/renderColumnFields'
import formatAsOptionData from '../../helpers/formatAsOptionData'

export default function CarsSearchForm({staticFormDataUrl, currentYear}) {

    const [makesAndModels, setMakesAndModels] = useState([])
    const [selectedMakeId, setSelectedMakeId] = useState('')
    const [selectedModelId, setSelectedModelId] = useState('')

    const [regionsAndSettlements, setRegionsAndSettlements] = useState([])
    const [selectedRegionId, setSelectedRegionId] = useState('')
    const [selectedSettlementId, setSelectedSettlementId] = useState('')

    const [fuels, setFuels] = useState([])
    const [gearboxes, setGearboxes] = useState([])

    useEffect(() => {

        fetch(staticFormDataUrl)
            .then((response) => response.json())
            .then((data) => {
    
                setFuels(data.fuels)
                setGearboxes(data.gearboxes)

                let makesAndModelsData = data.makes_and_models
                setMakesAndModels(makesAndModelsData)

                let regionsAndSettlementsData = data.regions_and_settlements
                setRegionsAndSettlements(regionsAndSettlementsData)
            })
    }, [])

    let modelOptions = [{value: '', label: 'Всички'}]
    if (selectedMakeId !== '') {
        modelOptions.push(...formatAsOptionData(makesAndModels.filter(make => make.id == selectedMakeId)[0].models, 'id', 'title'))
    }

    let settlementOptions = [{value: '', label: 'Всички'}]
    if(selectedRegionId !== '') {
        settlementOptions.push(...formatAsOptionData(regionsAndSettlements.filter(region => region.id == selectedRegionId)[0].settlements, 'id', 'title'))
    }

    let yearsOptions = [{value: '', label: 'Всички'}]

    for (let year = currentYear; year > 1930; year--) {
        yearsOptions.push({
            label: 'След ' + year,
            value: year
        })
    }

    const formFields = [
        {
            label: 'Марка',
            name: 'make_id',
            type: 'dropdown',
            options: [
                {value: '', label: 'Всички'},
                ...formatAsOptionData(makesAndModels, 'id', 'title')
            ],
            value: selectedMakeId,
            onChange: (e) => {
                setSelectedMakeId(e.target.value)
                setSelectedModelId('')
            }
        },
        {
            label: 'Модел',
            name: 'model_id',
            type: 'dropdown',
            options: modelOptions,
            value: selectedModelId,
            onChange: (e) => {
                setSelectedModelId(e.target.value)
            }
        },
        {
            label: 'Област',
            name: 'region_id',
            type: 'dropdown',
            options: [
                {value: '', label: 'Всички'},
                ...formatAsOptionData(regionsAndSettlements, 'id', 'title')
            ],
            value: selectedRegionId,
            onChange: (e) => {
                setSelectedRegionId(e.target.value)
                setSelectedSettlementId('') // Reset choice.
            }
        },
        {
            label: 'Населено място',
            name: 'settlement_id',
            type: 'dropdown',
            options: settlementOptions,
            value: selectedSettlementId,
            onChange: (e) => {
                setSelectedSettlementId(e.target.value)
            }
        },
        {
            label: 'Макс. Цена (в лева)',
            name: 'max_price',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: 'Година',
            name: 'min_year',
            type: 'dropdown',
            options: yearsOptions
        },
        {
            label: 'Гориво',
            name: 'fuel_type_id',
            type: 'dropdown',
            options: [
                {value: '', label: 'Всички'},
                ...formatAsOptionData(fuels, 'id', 'title')
            ]
        },
        {
            label: 'Скоростна Кутия',
            name: 'gearbox_id',
            type: 'dropdown',
            options: [
                {value: '', label: 'Всички'},
                ...formatAsOptionData(gearboxes, 'id', 'title')
            ]
        },
        {
            label: 'Подреди по',
            name: 'sort',
            type: 'dropdown',
            sizeClasses: 'col-12 col-md-6',
            options: [
                {label: 'Най - скоро публикувани', value: 'created_at_desc'},
                {label: 'Най - отдавна публикувани', value: 'created_at_asc'},
                {label: 'Цена - Възходящо', value: 'price_asc'},
                {label: 'Цена - Низходящо', value: 'price_desc'},
                {label: 'Година На Производство - Възходящо', value: 'manufacture_year_asc'},
                {label: 'Година На Производство - Низходящо', value: 'manufacture_year_desc'}
            ]
        },
    ]

    return (
        <form method='GET' action='/cars'>
            <div className="row gy-3">
                {renderColumnFields(formFields)}

                <div className='col-12 col-md-6 d-flex'>
                    <button className='btn btn-primary w-100 mt-auto mb-1 mx-1'>
                        <p className='h6'>Търси</p>
                    </button>
                </div>
            </div>
        </form>
    )
}