import React, {useState, useEffect, FC, ChangeEvent} from 'react'
import renderColumnFields from '../../helpers/renderColumnFields'
import formatAsOptionData from '../../helpers/formatAsOptionData'
import CarsSearchFormProps from '../../common/interfaces/properties/CarsSearchFormProps'
import VehicleAdInterface from '../../common/interfaces/models/VehicleAdInterface'
import RegionInterface from '../../common/interfaces/models/RegionInterface'
import FuelInterface from '../../common/interfaces/models/FuelInterface'
import GearboxInterface from '../../common/interfaces/models/GearboxInterface'
import StaticFormDataResponse from '../../common/interfaces/responses/StaticFormDataResponse'
import MakeInterface from '../../common/interfaces/models/MakeInterface'
import SelectOptions from '../../common/interfaces/dom_elemens_data/SelectOptions'

const CarsSearchForm: FC<CarsSearchFormProps> = ({staticFormDataUrl, currentYear}) => {

    const [makesAndModels, setMakesAndModels] = useState<Array<MakeInterface>>([])
    const [selectedMakeId, setSelectedMakeId] = useState<number>(0)
    const [selectedModelId, setSelectedModelId] = useState<number>(0)

    const [regionsAndSettlements, setRegionsAndSettlements] = useState<Array<RegionInterface>>([])
    const [selectedRegionId, setSelectedRegionId] = useState<number>(0)
    const [selectedSettlementId, setSelectedSettlementId] = useState<number>(0)

    const [fuels, setFuels] = useState<Array<FuelInterface>>([])
    const [gearboxes, setGearboxes] = useState<Array<GearboxInterface>>([])

    useEffect(() => {

        fetch(staticFormDataUrl)
            .then((response) => response.json())
            .then((data: StaticFormDataResponse) => {
    
                setFuels(data.fuels)
                setGearboxes(data.gearboxes)

                let makesAndModelsData = data.makes_and_models
                setMakesAndModels(makesAndModelsData)

                let regionsAndSettlementsData = data.regions_and_settlements
                setRegionsAndSettlements(regionsAndSettlementsData)
            })
    }, [])

    let modelOptions: Array<SelectOptions> = [{value: '0', label: 'Всички'}]
    if (selectedMakeId !== 0) {
        modelOptions.push(...formatAsOptionData(makesAndModels.filter(make => make.id == selectedMakeId)[0].models, 'id', 'title'))
    }

    let settlementOptions: Array<SelectOptions> = [{value: '0', label: 'Всички'}]
    if(selectedRegionId !== 0) {
        settlementOptions.push(...formatAsOptionData(regionsAndSettlements.filter(region => region.id == selectedRegionId)[0].settlements, 'id', 'title'))
    }

    let yearsOptions: Array<SelectOptions> = [{value: '0', label: 'Всички'}]

    for (let year = currentYear; year > 1930; year--) {
        yearsOptions.push({
            label: 'След ' + year,
            value: year + ''
        })
    }

    const formFields = [
        {
            label: 'Марка',
            name: 'make_id',
            type: 'dropdown',
            options: [
                {value: '0', label: 'Всички'},
                ...formatAsOptionData(makesAndModels, 'id', 'title')
            ],
            value: selectedMakeId,
            onChange: (e: ChangeEvent<HTMLSelectElement>) => {
                setSelectedMakeId(parseInt(e.target.value))
                setSelectedModelId(0)
            }
        },
        {
            label: 'Модел',
            name: 'model_id',
            type: 'dropdown',
            options: modelOptions,
            value: selectedModelId,
            onChange: (e: ChangeEvent<HTMLSelectElement>) => {
                setSelectedModelId(parseInt(e.target.value))
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
            onChange: (e: ChangeEvent<HTMLSelectElement>) => {
                setSelectedRegionId(parseInt(e.target.value))
                setSelectedSettlementId(0) // Reset choice.
            }
        },
        {
            label: 'Населено място',
            name: 'settlement_id',
            type: 'dropdown',
            options: settlementOptions,
            value: selectedSettlementId,
            onChange: (e: ChangeEvent<HTMLSelectElement>) => {
                setSelectedSettlementId(parseInt(e.target.value))
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

export default CarsSearchForm