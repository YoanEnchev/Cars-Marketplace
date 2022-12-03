import React, {useEffect, useState} from 'react'

import '../../../../scss/components/car-ad-form.scss'
import ImageUpload from './ImageUpload'
import CarExtraSelectionModal from './CarExtraSelectionModal'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faAngleRight } from '@fortawesome/free-solid-svg-icons'

import formatAsOptionData from '../../../helpers/formatAsOptionData'

export default function CarAdForm(props) {
    
    const [showExtraModal, setShowExtraModal] = useState(false)

    const [makesAndModels, setMakesAndModels] = useState([])
    const [selectedMakeId, setSelectedMakeId] = useState('')
    const [selectedModelId, setSelectedModelId] = useState('')

    const [regionsAndSettlements, setRegionsAndSettlements] = useState([])
    const [selectedRegionId, setSelectedRegionId] = useState('')
    const [selectedSettlementId, setSelectedSettlementId] = useState('')

    const [carBodyConfigurations, setCarBodyConfigurations] = useState([])
    const [colors, setColors] = useState([])
    const [ecoStandarts, setEcoStandarts] = useState([])
    const [fuels, setFuels] = useState([])
    const [gearboxes, setGearboxes] = useState([])

    const [carExtras, setCarExtras] = useState([])
    const [carExtrasSerialized, setCarExtrasSerialized] = useState({}) // It's value is set in hidden input when form is submited.
    const [openedCategoryId, setOpenedCategoryId] = useState('')

    function handleExtraModalClose() {
        setShowExtraModal(false)
        resetCategory()
    }

    function handleExtraModalShow(categoryId) {
        setShowExtraModal(true)
        setOpenedCategoryId(categoryId)
    }

    function getActiveExtraCategory() {
        return carExtras.filter(carExtra => carExtra.id === openedCategoryId)[0]
    }

    function handleExtraModalSave(selectedIds) {
        setShowExtraModal(false)

        // Modifying carExtrasResult changes properties of carExtras since objects are passed by reference.
        let carExtrasResult = getActiveExtraCategory()

        carExtrasResult.items = carExtrasResult.items.map((extra => {
            extra.selected = selectedIds.includes(extra.id + '')
            
            return extra
        }))

        saveExtras(carExtras)
        resetCategory()
    }

    function resetCategory() {
        // Reset opened category with delay, so content of extras modal remains the same while transiting to closed state.
        setTimeout(() => setOpenedCategoryId(''), 250)
    }

    function saveExtras(carExtras) {
        setCarExtras(carExtras)

        let serializationExtras = {}

        carExtras.forEach(extraCategory => {
            let selectedExtras = extraCategory.items.filter(item => item.selected)

            if (selectedExtras.length > 0) {
                serializationExtras[extraCategory.id] = selectedExtras.map(extra => extra.id)
            }
        })

        setCarExtrasSerialized(serializationExtras)
    }

    useEffect(() => {

        fetch('/cars/static-form-data')
            .then((response) => response.json())
            .then((data) => {
   
                setCarBodyConfigurations(data.car_body_configuration)
                setColors(data.colors)
                setEcoStandarts(data.eco_standarts)
                setFuels(data.fuels)
                setGearboxes(data.gearboxes)

                let makesAndModelsData = data.makes_and_models
                setMakesAndModels(makesAndModelsData)
                setSelectedMakeId(makesAndModelsData[0].id)

                let regionsAndSettlementsData = data.regions_and_settlements
                setRegionsAndSettlements(regionsAndSettlementsData)
                setSelectedRegionId(regionsAndSettlementsData[0].id)
                
                // Attach selected attribute.
                saveExtras(data.extras.map(extraCategory => {
                    extraCategory.items = extraCategory.items.map(extra => {
                        extra.selected = false
                        return extra
                    })
                    return extraCategory
                }))
            })
    }, [])

    const formFields = [
        {
            label: 'Марка',
            name: 'make_id',
            type: 'dropdown',
            options: formatAsOptionData(makesAndModels, 'id', 'title'),
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
            options: selectedMakeId === '' ? [] : formatAsOptionData(makesAndModels.filter(make => make.id == selectedMakeId)[0].models, 'id', 'title'),
            startWithEmptyValue: true,
            value: selectedModelId,
            onChange: (e) => {
                setSelectedModelId(e.target.value)
            }
        },
        {
            label: 'Модификация',
            name: 'modification',
            type: 'input', 
            inputType: 'text',
            placeholder: 'Например: 1.6 CDI'
        },
        {
            label: 'Гориво',
            name: 'fuel_id',
            type: 'dropdown',
            options: formatAsOptionData(fuels, 'id', 'title')
        },
        {
            label: 'Евростандарт',
            name: 'eurostandart_id',
            type: 'dropdown',
            options: formatAsOptionData(ecoStandarts, 'id', 'title'),
        },
        {
            label: 'Скоростна Кутия',
            name: 'gearbox_id',
            type: 'dropdown',
            options: formatAsOptionData(gearboxes, 'id', 'title'),
        },
        {
            label: 'Тип',
            name: 'car_body_configuration_id',
            type: 'dropdown',
            options: formatAsOptionData(carBodyConfigurations, 'id', 'title')
        },
        {
            label: 'Цвят',
            name: 'color_id',
            type: 'dropdown',
            options: formatAsOptionData(colors, 'id', 'title')
        },
        {
            label: 'Цена (в лева)',
            name: 'price',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: 'Мощност (к.с.)',
            name: 'hp',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: 'Година на производство',
            name: 'manufacture_year',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: 'Пробег',
            name: 'mileage',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: 'Област',
            name: 'region_id',
            type: 'dropdown',
            options: formatAsOptionData(regionsAndSettlements, 'id', 'title'),
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
            options: selectedRegionId === '' ? [] : formatAsOptionData(regionsAndSettlements.filter(region => region.id == selectedRegionId)[0].settlements, 'id', 'title'),
            startWithEmptyValue: true,
            value: selectedSettlementId,
            onChange: (e) => {
                setSelectedSettlementId(e.target.value)
            }
        },
        {
            label: 'Описание',
            name: 'description',
            type: 'textarea',
            size: 'entire-row',
            maxLength: 500,
            minHeight: '128px'
        },
    ]
    
    return (
        <>
            <form method='POST' 
                action={props.actionUrl} 
                className='car-ad-form' >
                <div className="row gy-3">
                    {formFields.map((field, index) => {

                        let fieldType = field.type

                        let sizeClasses = 'col-6 col-md-3'
                        
                        if (field.size === 'entire-row') {
                            sizeClasses = 'col-12'
                        }

                        let fieldClasses = 'mt-2 ' + (fieldType === 'dropdown' ? 'form-select' : 'form-control')

                        let propsObj = {
                            className: fieldClasses,
                            placeholder: field.placeholder,
                            name: field.name,
                            maxLength: field.maxLength,
                            placeholder: field.placeholder,
                            style: {
                                minHeight: field.minHeight
                            },
                            onChange: field.onChange,
                            value: field.value
                        }

                        return (
                            <div className={`field-wrapper ${sizeClasses}`} key={index}>
                                <label className='p-1'>{field.label}
                                    {
                                        fieldType === 'input' ?
                                            <input {...propsObj} /> :
                                        fieldType === 'dropdown' ?
                                            <select {...propsObj} >
                                                {field.options.map((optionData, index) => <option value={optionData.value} key={index}>{optionData.label}</option>)}
                                            </select> :
                                        fieldType === 'textarea' ? 
                                            <textarea rows="5" {...propsObj}></textarea>
                                        : ''
                                    }
                                </label>
                            </div>
                        )
                    })}
                </div>
        
                <div id="cars-extras-container" className='mt-4'>
                    <p className='h5 mb-3'>Избери екстри</p>
                    <ul className="list-group">
                        {carExtras.map((categoryData, groupIndex) => {
                            
                            let selectedExtras = categoryData.items.filter(item => item.selected)

                            return <li className="list-group-item" key={groupIndex} onClick={() => handleExtraModalShow(categoryData.id)}>
                                <div className='d-flex'>
                                    <div className='w-100'>
                                        <p className='me-2'>
                                            {categoryData.title + ` (${selectedExtras.length} избрани)`}
                                            <small className='d-block text-gray mt-2'>
                                                {selectedExtras.map(item => item.title).join(', ')}
                                            </small>
                                        </p>
                                    </div>
                                    <div className='align-self-center'>
                                        <FontAwesomeIcon icon={faAngleRight} />
                                    </div>
                                </div>
                            </li>
                        })}
                    </ul>
                </div>
                <div className='mt-4'>
                    <ImageUpload />
                </div>
                {/* Render selected extras as hidden input so their value is sent to server on form submit. */}
                {carExtras.map(extraCategory => extraCategory.items
                    .filter(item => item.selected)
                    .map((extra, index) => <input type='hidden' name={`extras[${extraCategory.id}]`} value={extra.id} key={index} />))
                }

                <input type='hidden' name='extras' value={JSON.stringify(carExtrasSerialized)} />

                <button className='btn btn-primary my-3'>Публикувай</button>
            </form>

            <CarExtraSelectionModal show={showExtraModal}
                extras={openedCategoryId === '' ? [] : getActiveExtraCategory().items}
                onHide={handleExtraModalClose}
                onSave={handleExtraModalSave}
            />
        </>
    )
}