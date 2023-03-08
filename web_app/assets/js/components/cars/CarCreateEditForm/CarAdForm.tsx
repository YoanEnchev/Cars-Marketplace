import React, {useEffect, useState, ChangeEvent, FC} from 'react'

import '../../../../scss/components/car-ad-form.scss'
import ImageUpload from './ImageUpload'
import CarExtraSelectionModal from './CarExtraSelectionModal'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faAngleRight } from '@fortawesome/free-solid-svg-icons'

import formatAsOptionData from '../../../helpers/formatAsOptionData'
import renderColumnFields from '../../../helpers/renderColumnFields'

import EcoStandartInterface from '../../../common/interfaces/models/EcoStandartInterface'
import MakeInterface from '../../../common/interfaces/models/MakeInterface'
import ModelInterface from '../../../common/interfaces/models/ModelInterface'
import SettlementInterface from '../../../common/interfaces/models/SettlementInterface'
import RegionInterface from '../../../common/interfaces/models/RegionInterface'
import CarBodyConfigurationInterface from '../../../common/interfaces/models/CarBodyConfigurationInterface'
import ColorInterface from '../../../common/interfaces/models/ColorInterface'
import GearboxInterface from '../../../common/interfaces/models/GearboxInterface'
import ExtraCategoryInterface from '../../../common/interfaces/models/ExtraCategoryInterface'
import ExtraCategoryItemInterface from '../../../common/interfaces/models/ExtraCategoryItemInterface'

import CarAdFormProps from '../../../common/interfaces/properties/CarAdFormProps'
import StaticFormDataResponse from '../../../common/interfaces/responses/staticFormDataResponse'

const CarAdForm: FC<CarAdFormProps> = ({staticFormDataUrl, vehicleParams = null, actionUrl, buttonText, currentYear}) => {
    
    const [showExtraModal, setShowExtraModal] = useState<boolean>(false)

    const [makesAndModels, setMakesAndModels] = useState<Array<MakeInterface>>([])
    const [selectedMakeId, setSelectedMakeId] = useState<number>(0)
    const [selectedModelId, setSelectedModelId] = useState<number>(vehicleParams ? vehicleParams.model.id : 0)
    
    const [selectedFuelId, setSelectedFuelId] = useState<number>(0)
    const [fuels, setFuels] = useState<Array<EcoStandartInterface>>([])
    
    const [selectedEcoStandartId, setSelectedEcoStandartId] = useState<number>(0)
    const [ecoStandarts, setEcoStandarts] = useState<Array<EcoStandartInterface>>([])

    const [regionsAndSettlements, setRegionsAndSettlements] = useState<Array<RegionInterface>>([])
    const [selectedRegionId, setSelectedRegionId] = useState<number>(0)
    const [selectedSettlementId, setSelectedSettlementId] = useState<number>(vehicleParams ? vehicleParams.settelment.id : 0)

    const [carBodyConfigurations, setCarBodyConfigurations] = useState<Array<CarBodyConfigurationInterface>>([])
    const [selectedCarBodyConfiguration, setSelectedCarBodyConfiguration] = useState<number>(0)
    
    const [selectedColorId, setSelectedColorId] = useState<number>(0)
    const [colors, setColors] = useState<Array<ColorInterface>>([])

    const [selectedGearboxId, setSelectedGearboxId] = useState<number>(0)
    const [gearboxes, setGearboxes] = useState<Array<GearboxInterface>>([])

    const [carExtras, setCarExtras] = useState<Array<ExtraCategoryInterface>>([])
    const [carExtrasSerialized, setCarExtrasSerialized] = useState<Array<number>>([]) // It's value is set in hidden input when form is submited.
    const [openedCategoryId, setOpenedCategoryId] = useState<number>(0)

    function handleExtraModalClose(): void {
        setShowExtraModal(false)
        resetCategory()
    }

    function handleExtraModalShow(categoryId: number): void {
        setShowExtraModal(true)
        setOpenedCategoryId(categoryId)
    }

    function getActiveExtraCategory(): ExtraCategoryInterface {
        return carExtras.filter((carExtra: ExtraCategoryInterface) => carExtra.id === openedCategoryId)[0]
    }

    function handleExtraModalSave(selectedIds: Array<number>): void {
        setShowExtraModal(false)

        // Modifying carExtrasResult changes properties of carExtras since objects are passed by reference.
        let carExtrasResult: ExtraCategoryInterface = getActiveExtraCategory()

        carExtrasResult.items = carExtrasResult.items.map(((extra: ExtraCategoryItemInterface) => {
            extra.selected = selectedIds.includes(extra.id)
            
            return extra
        }))

        saveExtras(carExtras)
        resetCategory()
    }

    function resetCategory(): void {
        // Reset opened category with delay, so content of extras modal remains the same while transiting to closed state.
        setTimeout(() => setOpenedCategoryId(0), 250)
    }

    function saveExtras(carExtras: Array<ExtraCategoryInterface>): void {
        setCarExtras(carExtras)

        let serializationExtras: Array<number> = []

        carExtras.forEach((extraCategory: ExtraCategoryInterface) => serializationExtras.push(...extraCategory.items
                .filter(item => item.selected)
                .map(extra => extra.id)))

        setCarExtrasSerialized(serializationExtras)
    }

    useEffect(() => {

        fetch(staticFormDataUrl)
            .then((response) => response.json())
            .then((data: StaticFormDataResponse) => {
   
                const carBodyConfigurations = data.car_body_configuration
                setCarBodyConfigurations(carBodyConfigurations)
                setSelectedCarBodyConfiguration(vehicleParams ? vehicleParams.car_body_configuration.id : carBodyConfigurations[0].id)

                const colors = data.colors
                setColors(colors)
                setSelectedColorId(vehicleParams ? vehicleParams.color.id : colors[0].id)

                const fuels = data.fuels;
                setFuels(fuels)
                setSelectedFuelId(vehicleParams ? vehicleParams.fuel_type.id : fuels[0].id)

                const ecoStandarts = data.eco_standarts
                setEcoStandarts(ecoStandarts)
                setSelectedEcoStandartId(vehicleParams ? vehicleParams.eco_standart.id : ecoStandarts[0].id)

                const gearboxes = data.gearboxes
                setSelectedGearboxId(vehicleParams ? vehicleParams.gearbox.id: gearboxes[0].id)
                setGearboxes(gearboxes)

                let makesAndModelsData = data.makes_and_models
                setMakesAndModels(makesAndModelsData)
                setSelectedMakeId(vehicleParams ? vehicleParams.make.id : makesAndModelsData[0].id)

                let regionsAndSettlementsData = data.regions_and_settlements
                setRegionsAndSettlements(regionsAndSettlementsData)
                setSelectedRegionId(vehicleParams ? vehicleParams.settelment.region_id : regionsAndSettlementsData[0].id)

                let filledExtrasIds: Array<number> = [] // ids from prefilled edit page.
                if (vehicleParams) filledExtrasIds = vehicleParams.extras.map(extraData => extraData.id)

                // Attach selected attribute.
                saveExtras(data.extras.map((extraCategory: ExtraCategoryInterface) => {
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
            label: 'Марка',
            name: 'make_id',
            type: 'dropdown',
            options: formatAsOptionData(makesAndModels, 'id', 'title'),
            value: selectedMakeId,
            onChange: (e: ChangeEvent<HTMLInputElement>) => {
                setSelectedMakeId(Number.parseInt(e.target.value))
                setSelectedModelId(0)
            }
        },
        {
            label: 'Модел',
            name: 'model_id',
            type: 'dropdown',
            options: (selectedMakeId === 0 || makesAndModels.length === 0) ? [] : formatAsOptionData(makesAndModels.filter(make => make.id == selectedMakeId)[0].models, 'id', 'title'),
            value: selectedModelId,
            onChange: (e: ChangeEvent<HTMLInputElement>) => setSelectedModelId(Number.parseInt(e.target.value))
        },
        {
            label: 'Модификация',
            defaultValue: vehicleParams ? vehicleParams.modification : '',
            name: 'modification',
            type: 'input', 
            required: 'required',
            inputType: 'text',
            placeholder: 'Например: 1.6 CDI',
            minLength: 3,
            maxLength: 20
        },
        {
            label: 'Гориво',
            // defaultValue property is not working.
            // That's why we use value and onChange props instead.
            value: selectedFuelId,
            name: 'fuel_type_id',
            type: 'dropdown',
            options: formatAsOptionData(fuels, 'id', 'title'),
            onChange: (e: ChangeEvent<HTMLInputElement>) => setSelectedFuelId(Number.parseInt(e.target.value))
        },
        {
            label: 'Евростандарт',
            value: selectedEcoStandartId,
            name: 'eco_standart_id',
            type: 'dropdown',
            options: formatAsOptionData(ecoStandarts, 'id', 'title'),
            onChange: (e: ChangeEvent<HTMLInputElement>) => setSelectedEcoStandartId(Number.parseInt(e.target.value))
        },
        {
            label: 'Скоростна Кутия',
            value: selectedGearboxId,
            name: 'gearbox_id',
            type: 'dropdown',
            options: formatAsOptionData(gearboxes, 'id', 'title'),
            onChange: (e: ChangeEvent<HTMLInputElement>) => setSelectedGearboxId(Number.parseInt(e.target.value))
        },
        {
            label: 'Тип',
            value: selectedCarBodyConfiguration,
            name: 'car_body_configuration_id',
            type: 'dropdown',
            options: formatAsOptionData(carBodyConfigurations, 'id', 'title'),
            onChange: (e: ChangeEvent<HTMLInputElement>) => setSelectedCarBodyConfiguration(Number.parseInt(e.target.value))
        },
        {
            label: 'Цвят',
            value: selectedColorId,
            name: 'color_id',
            type: 'dropdown',
            options: formatAsOptionData(colors, 'id', 'title'),
            onChange: (e: ChangeEvent<HTMLInputElement>) => setSelectedColorId(Number.parseInt(e.target.value))
        },
        {
            label: 'Цена (в лева)',
            defaultValue: vehicleParams ? vehicleParams.price_raw : '',
            name: 'price',
            type: 'input', 
            required: 'required',
            inputType: 'number',
            min: 1, 
            max: Math.pow(10, 6)
        },
        {
            label: 'Мощност (к.с.)',
            defaultValue: vehicleParams ? vehicleParams.hp : '',
            name: 'hp',
            type: 'input', 
            required: 'required',
            inputType: 'number',
            min: 1,
            max: 10000
        },
        {
            label: 'Година на производство',
            defaultValue: vehicleParams ? vehicleParams.manufacture_year : '',
            name: 'manufacture_year',
            type: 'input', 
            required: 'required',
            inputType: 'number',
            min: 1900,
            max: currentYear
        },
        {
            label: 'Пробег',
            defaultValue: vehicleParams ? vehicleParams.mileage : '',
            name: 'mileage',
            type: 'input', 
            required: 'required',
            inputType: 'number',
            min: 0,
            max: 5 * Math.pow(10, 7)
        },
        {
            label: 'Област',
            name: 'region_id',
            type: 'dropdown',
            options: formatAsOptionData(regionsAndSettlements, 'id', 'title'),
            value: selectedRegionId,
            onChange: (e: ChangeEvent<HTMLInputElement>) => {
                setSelectedRegionId(Number.parseInt(e.target.value))
                setSelectedSettlementId(0) // Reset choice.
            }
        },
        {
            label: 'Населено място',
            name: 'settlement_id',
            type: 'dropdown',
            options: (selectedRegionId === 0 || regionsAndSettlements.length === 0) ? [] : formatAsOptionData(regionsAndSettlements.filter(region => region.id == selectedRegionId)[0].settlements, 'id', 'title'),
            value: selectedSettlementId,
            onChange: (e: ChangeEvent<HTMLInputElement>) => {
                setSelectedSettlementId(Number.parseInt(e.target.value))
            }
        },
        {
            label: 'Описание',
            defaultValue: vehicleParams ? vehicleParams.description : '',
            name: 'description',
            type: 'textarea',
            sizeClasses: 'col-12',
            maxLength: 500,
            minHeight: '128px'
        },
    ]
    
    return <>
            <form method='POST' 
                action={actionUrl} 
                className='car-ad-form' >
                <div className="row gy-3">
                    {renderColumnFields(formFields)}
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
                    <ImageUpload imgUrls={vehicleParams ? vehicleParams.imsge_urls : []}/>
                </div>

                <input type='hidden' name='extras' value={JSON.stringify(carExtrasSerialized)} />

                <button className='btn btn-primary my-3'>{buttonText}</button>
            </form>

            <CarExtraSelectionModal show={showExtraModal}
                extras={openedCategoryId === 0 ? [] : getActiveExtraCategory().items}
                onHide={handleExtraModalClose}
                onSave={handleExtraModalSave}
            />
        </>
}

export default CarAdForm