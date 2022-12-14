import React, {useEffect, useState} from 'react'

import '../../../../scss/components/car-ad-form.scss'
import ImageUpload from './ImageUpload'
import CarExtraSelectionModal from './CarExtraSelectionModal'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faAngleRight } from '@fortawesome/free-solid-svg-icons'

import formatAsOptionData from '../../../helpers/formatAsOptionData'
import renderColumnFields from '../../../helpers/renderColumnFields'

export default function CarAdForm({staticFormDataUrl, vehicleParams = null, actionUrl, buttonText}) {
    
    const [showExtraModal, setShowExtraModal] = useState(false)

    const [makesAndModels, setMakesAndModels] = useState([])
    const [selectedMakeId, setSelectedMakeId] = useState('')
    const [selectedModelId, setSelectedModelId] = useState(vehicleParams ? vehicleParams.model.id : '')
    
    const [selectedFuelId, setSelectedFuelId] = useState('')
    const [fuels, setFuels] = useState([])
    
    const [selectedEcoStandartId, setSelectedEcoStandartId] = useState('')
    const [ecoStandarts, setEcoStandarts] = useState([])

    const [regionsAndSettlements, setRegionsAndSettlements] = useState([])
    const [selectedRegionId, setSelectedRegionId] = useState('')
    const [selectedSettlementId, setSelectedSettlementId] = useState(vehicleParams ? vehicleParams.settelment.id : '')

    const [carBodyConfigurations, setCarBodyConfigurations] = useState([])
    const [selectedCarBodyConfiguration, setSelectedCarBodyConfiguration] = useState('')
    
    const [selectedColorId, setSelectedColorId] = useState('')
    const [colors, setColors] = useState([])

    const [selectedGearboxId, setSelectedGearboxId] = useState('')
    const [gearboxes, setGearboxes] = useState([])

    const [carExtras, setCarExtras] = useState([])
    const [carExtrasSerialized, setCarExtrasSerialized] = useState([]) // It's value is set in hidden input when form is submited.
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

        let serializationExtras = []

        carExtras.forEach(extraCategory => serializationExtras.push(...extraCategory.items
                .filter(item => item.selected)
                .map(extra => extra.id)))

        setCarExtrasSerialized(serializationExtras)
    }

    useEffect(() => {

        fetch(staticFormDataUrl)
            .then((response) => response.json())
            .then((data) => {
   
                const carBodyConfigurations = data.car_body_configuration
                setCarBodyConfigurations(carBodyConfigurations)
                setSelectedCarBodyConfiguration(vehicleParams ? vehicleParams.car_body_configuration.id : carBodyConfigurations[0].id)

                const colors = data.colors
                setColors(colors)
                setSelectedColorId(vehicleParams ? vehicleParams.color.id : colors[0])

                const fuels = data.fuels;
                setFuels(fuels)
                setSelectedFuelId(vehicleParams ? vehicleParams.fuel_type.id : fuels[0])

                const ecoStandarts = data.eco_standarts
                setEcoStandarts(ecoStandarts)
                setSelectedEcoStandartId(vehicleParams ? vehicleParams.eco_standart.id : ecoStandarts[0])

                const gearboxes = data.gearboxes;
                setSelectedGearboxId(vehicleParams ? vehicleParams.gearbox.id: gearboxes[0])
                setGearboxes(gearboxes)

                let makesAndModelsData = data.makes_and_models
                setMakesAndModels(makesAndModelsData)
                setSelectedMakeId(vehicleParams ? vehicleParams.make.id : makesAndModelsData[0].id)

                let regionsAndSettlementsData = data.regions_and_settlements
                setRegionsAndSettlements(regionsAndSettlementsData)
                setSelectedRegionId(vehicleParams ? vehicleParams.settelment.region_id : regionsAndSettlementsData[0].id)

                let filledExtrasIds = [] // ids from prefilled edit page.
                if (vehicleParams) filledExtrasIds = vehicleParams.extras.map(extraData => extraData.id)

                // Attach selected attribute.
                saveExtras(data.extras.map(extraCategory => {
                    extraCategory.items = extraCategory.items.map(extra => {
                        extra.selected = filledExtrasIds.includes(extra.id)
                        return extra
                    })
                    return extraCategory
                }))
            })
    }, [])

    const formFields = [
        {
            label: '??????????',
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
            label: '??????????',
            name: 'model_id',
            type: 'dropdown',
            options: (selectedMakeId === '' || makesAndModels.length === 0) ? [] : formatAsOptionData(makesAndModels.filter(make => make.id == selectedMakeId)[0].models, 'id', 'title'),
            value: selectedModelId,
            onChange: (e) => setSelectedModelId(e.target.value)
        },
        {
            label: '??????????????????????',
            defaultValue: vehicleParams ? vehicleParams.modification : '',
            name: 'modification',
            type: 'input', 
            inputType: 'text',
            placeholder: '????????????????: 1.6 CDI'
        },
        {
            label: '????????????',
            // defaultValue property is not working.
            // That's why we use value and onChange props instead.
            value: selectedFuelId,
            name: 'fuel_type_id',
            type: 'dropdown',
            options: formatAsOptionData(fuels, 'id', 'title'),
            onChange: (e) => setSelectedFuelId(e.target.value)
        },
        {
            label: '????????????????????????',
            value: selectedEcoStandartId,
            name: 'eco_standart_id',
            type: 'dropdown',
            options: formatAsOptionData(ecoStandarts, 'id', 'title'),
            onChange: (e) => setSelectedEcoStandartId(e.target.value)
        },
        {
            label: '?????????????????? ??????????',
            value: selectedGearboxId,
            name: 'gearbox_id',
            type: 'dropdown',
            options: formatAsOptionData(gearboxes, 'id', 'title'),
            onChange: (e) => setSelectedGearboxId(e.target.value)
        },
        {
            label: '??????',
            value: selectedCarBodyConfiguration,
            name: 'car_body_configuration_id',
            type: 'dropdown',
            options: formatAsOptionData(carBodyConfigurations, 'id', 'title'),
            onChange: (e) => setSelectedCarBodyConfiguration(e.target.value)
        },
        {
            label: '????????',
            value: selectedColorId,
            name: 'color_id',
            type: 'dropdown',
            options: formatAsOptionData(colors, 'id', 'title'),
            onChange: (e) => setSelectedColorId(e.target.value)
        },
        {
            label: '???????? (?? ????????)',
            defaultValue: vehicleParams ? vehicleParams.price_raw : '',
            name: 'price',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: '?????????????? (??.??.)',
            defaultValue: vehicleParams ? vehicleParams.hp : '',
            name: 'hp',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: '???????????? ???? ????????????????????????',
            defaultValue: vehicleParams ? vehicleParams.manufacture_year : '',
            name: 'manufacture_year',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: '????????????',
            defaultValue: vehicleParams ? vehicleParams.mileage : '',
            name: 'mileage',
            type: 'input', 
            inputType: 'number'
        },
        {
            label: '????????????',
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
            label: '???????????????? ??????????',
            name: 'settlement_id',
            type: 'dropdown',
            options: (selectedRegionId === '' || regionsAndSettlements.length === 0) ? [] : formatAsOptionData(regionsAndSettlements.filter(region => region.id == selectedRegionId)[0].settlements, 'id', 'title'),
            value: selectedSettlementId,
            onChange: (e) => {
                setSelectedSettlementId(e.target.value)
            }
        },
        {
            label: '????????????????',
            defaultValue: vehicleParams ? vehicleParams.description : '',
            name: 'description',
            type: 'textarea',
            sizeClasses: 'col-12',
            maxLength: 500,
            minHeight: '128px'
        },
    ]
    
    return (
        <>
            <form method='POST' 
                action={actionUrl} 
                className='car-ad-form' >
                <div className="row gy-3">
                    {renderColumnFields(formFields)}
                </div>
        
                <div id="cars-extras-container" className='mt-4'>
                    <p className='h5 mb-3'>???????????? ????????????</p>
                    <ul className="list-group">
                        {carExtras.map((categoryData, groupIndex) => {
                            
                            let selectedExtras = categoryData.items.filter(item => item.selected)

                            return <li className="list-group-item" key={groupIndex} onClick={() => handleExtraModalShow(categoryData.id)}>
                                <div className='d-flex'>
                                    <div className='w-100'>
                                        <p className='me-2'>
                                            {categoryData.title + ` (${selectedExtras.length} ??????????????)`}
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
                    <ImageUpload imgUrls={vehicleParams ? vehicleParams.imsge_urls : []}/>
                </div>

                <input type='hidden' name='extras' value={JSON.stringify(carExtrasSerialized)} />

                <button className='btn btn-primary my-3'>{buttonText}</button>
            </form>

            <CarExtraSelectionModal show={showExtraModal}
                extras={openedCategoryId === '' ? [] : getActiveExtraCategory().items}
                onHide={handleExtraModalClose}
                onSave={handleExtraModalSave}
            />
        </>
    )
}