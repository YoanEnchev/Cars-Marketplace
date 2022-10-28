import React, {useEffect, useState} from 'react'

import '../../../../scss/components/car-ad-form.scss'
import ImageUpload from './ImageUpload'
import CarExtraSelectionModal from './CarExtraSelectionModal'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faAngleRight } from '@fortawesome/free-solid-svg-icons'



export default function CarAdForm(props) {
    
    const [formFields, setFormFields] = useState([])
    const [showExtraModal, setShowExtraModal] = useState(false)
    
    const [carExtras, setCarExtras] = useState({})
    const [openedCategoryId, setOpenedCategoryId] = useState('')

    function handleExtraModalClose() {
        setShowExtraModal(false)
        resetCategory()
    }

    function handleExtraModalShow(categoryId) {
        setShowExtraModal(true)
        setOpenedCategoryId(categoryId)
    }

    function handleExtraModalSave(selectedIds) {
        setShowExtraModal(false)

        carExtras[openedCategoryId].items = carExtras[openedCategoryId].items.map((extra => {
            extra.selected = selectedIds.includes(extra.id + '')

            return extra
        }))

        setCarExtras(carExtras)
        resetCategory()
    }

    function resetCategory() {
        // Reset opened category with delay, so content of extras modal remains the same while transiting to closed state.
        setTimeout(() => setOpenedCategoryId(''), 250)
    }

    useEffect(() => {
        setFormFields([
            {
                label: 'Вид превозно средство',
                name: 'vehicle_type',
                type: 'dropdown',
                values: {
                    '1': 'Автомобил',
                    '2': 'Мотор / Скутер',
                    '3': 'Камион'
                }
            },
            {
                label: 'Марка',
                name: 'make',
                type: 'dropdown',
                values: {
                    '1': 'One',
                    '2': 'Two',
                    '3': 'Three'
                }
            },
            {
                label: 'Модел',
                name: 'model',
                type: 'dropdown',
                values: {
                    '1': 'One',
                    '2': 'Two',
                    '3': 'Three'
                },
                addDisabledOption: 'Избери марка',
                startWithEmptyValue: true
            },
            {
                label: 'Модификация',
                name: 'Modification',
                type: 'input', 
                inputType: 'text',
                placeholder: 'Например: 1.6 CDI'
            },
            {
                label: 'Гориво',
                name: 'fuel',
                type: 'dropdown',
                values: {
                    '1': 'Бензин',
                    '2': 'Газ/Бензин',
                    '3': 'Метан/Бензин',
                    '4': 'Дизел',
                    '5': 'Хибрид',
                    '4': 'Електричество'
                }
            },
            {
                label: 'Мощност (к.с.)',
                name: 'hp',
                type: 'input', 
                inputType: 'number'
            },
            {
                label: 'Евростандарт',
                name: 'eurostandart',
                type: 'dropdown',
                values: {
                    '1': 'Евро 1',
                    '2': 'Евро 2',
                    '3': 'Евро 3',
                    '4': 'Евро 4',
                    '5': 'Евро 5',
                    '4': 'Евро 6'
                },
            },
            {
                label: 'Скоростна Кутия',
                name: 'gearbox',
                type: 'dropdown',
                values: {
                    '1': 'Ръчна',
                    '2': 'Автоматична',
                    '3': 'Полуавтоматична',
                },
            },
            {
                label: 'Тип',
                name: 'type',
                type: 'dropdown',
                values: {
                    '1': 'Хечбек',
                    '2': 'Джип',
                    '3': 'Кабрио',
                    '4': 'Комби',
                    '5': 'Купе',
                    '6': 'Миниван',
                    '7': 'Пикап',
                    '8': 'Седан',
                    '9': 'Стреч лимузина',
                    '10': 'Ван',
                }
            },
            {
                label: 'Цена (в лева)',
                name: 'price',
                type: 'input', 
                inputType: 'number'
            },
            /*{
                label: 'Валута',
                name: 'currency',
                type: 'dropdown',
                values: {
                    '1': 'лв.',
                    '2': 'USD',
                    '3': 'EURO'
                },
            },*/
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
                label: 'Цвят',
                name: 'type',
                type: 'dropdown',
                values: {
                    '1': 'Tъмно син',
                    '2': 'Банан',
                    '3': 'Бежов',
                    '4': 'Бордо',
                    '5': 'Бронз',
                    '6': 'Бял', 
                    '7': 'Винен', 
                    '8': 'Виолетов',
                    '9': 'Вишнев',
                    '10': 'Графит',
                    '11': 'Жълт',
                    '12': 'Зелен',
                    '13': 'Златист',
                    '14': 'Кафяв',
                    '15': 'Керемиден', 
                    '16': 'Кремав',
                    '17': 'Лилав',
                    '18': 'Металик',
                    '19': 'Оранжев',
                    '20': 'Охра', 
                    '21': 'Пепеляв',
                    '22': 'Перла',
                    '23': 'Пясъчен',
                    '24': 'Резидав',
                    '25': 'Розов',
                    '26': 'Сахара',
                    '27': 'Светло сив',
                    '28': 'Светло син', 
                    '29': 'Сив',
                    '30': 'Син',
                    '31': 'Сребърен', 
                    '32': 'Т.зелен',
                    '33': 'Тъмно сив', 
                    '34': 'Тъмно син мет.',
                    '35': 'Тъмно червен',
                    '36': 'Хамелеон',
                    '37': 'Червен',
                    '38': 'Черен'
                    
                }
            },
            {
                label: 'Област',
                name: 'region',
                type: 'dropdown',
                values: {
                    '1': 'София',
                    '2': 'Варна',
                    '3': 'Бургас',
                    '4': 'Пловдив',
                    '5': 'Русе',
                }
            },
            {
                label: 'Населено място',
                name: 'region',
                type: 'dropdown',
                values: {
                    '1': 'София',
                    '2': 'Своге',
                    '3': 'Ботевград',
                    '4': 'Банкя',
                },
                addDisabledOption: 'Избери област',
                startWithEmptyValue: true
            },
            {
                label: 'Описание',
                name: 'description',
                type: 'textarea',
                size: 'entire-row',
                maxLength: 500,
                minHeight: '128px'
            },
        ])

        setCarExtras({
            'extra_1': {
                name: 'Безопастост',
                items: [
                    {id: 1, name: '4х4', selected: false},
                    {id: 2, name: 'Автоматичен контрол на стабилността', selected: false},
                    {id: 3, name: 'Антиблокираща система (ABS)', selected: false},
                    {id: 4, name: 'Въздушни възглавници', selected: false},
                    {id: 5, name: 'Система ISOFIX', selected: false},
                    {id: 6, name: 'Система за динамична устойчивост', selected: false},
                    {id: 7, name: 'Система за защита от пробуксуване', selected: false},
                    {id: 8, name: 'Distronic', selected: false},
                    {id: 9, name: 'Система за контрол на спускането', selected: false},
                    {id: 10, name: 'Система за подпомагане на спирането', selected: false},
                    {id: 11, name: 'Контрол на налягането на гумите', selected: false},
                    {id: 12, name: 'Парктроник', selected: false}
                ]
            },
            'extra_2': {
                name: 'Комфорт',
                items: [
                    {id: 1, name: 'Старт Стоп система', selected: false},
                    {id: 2, name: 'DVD, TV', selected: false},
                    {id: 3, name: 'Steptronic, Tiptronic', selected: false},
                    {id: 4, name: 'Адаптивно въздушно окачване', selected: false},
                    {id: 5, name: 'Безключово палене', selected: false},
                    {id: 6, name: 'Блокаж на диференциала', selected: false},
                    {id: 7, name: 'Бордкомпютър', selected: false},
                    {id: 8, name: 'Ел. Огледала', selected: false},
                    {id: 9, name: 'Ел. Стъкла', selected: false},
                    {id: 10, name: 'Ел. регулиране на окачването', selected: false},
                    {id: 11, name: 'Ел. регулиране на седалките', selected: false},
                    {id: 12, name: 'Ел. усилвател на волана', selected: false},
                    {id: 13, name: 'Климатик', selected: false},
                    {id: 14, name: 'Климатроник', selected: false},
                    {id: 15, name: 'Мултифункционален волан', selected: false},
                    {id: 16, name: 'Навигация', selected: false},
                    {id: 17, name: 'Отопление на волана', selected: false},
                    {id: 18, name: 'Печка', selected: false},
                    {id: 19, name: 'Подгряване на предното стъкло', selected: false},
                    {id: 20, name: 'Подгряване на седалките', selected: false},
                    {id: 21, name: 'Регулиране на волана', selected: false},
                    {id: 22, name: 'Сензор за дъжд', selected: false},
                    {id: 23, name: 'Серво усилвател на волана', selected: false},
                    {id: 24, name: 'Система за измиване на фаровете', selected: false},
                    {id: 25, name: 'Круиз Контрол', selected: false},
                    {id: 26, name: 'Автопилот', selected: false},
                    {id: 27, name: 'Стерео уредба', selected: false},
                    {id: 28, name: 'Филтър за твърди частици', selected: false},
                    {id: 29, name: 'Хладилна жабка', selected: false}
                ]
            },
            'extra_3': {
                name: 'Безопастост',
                items: [
                    {id: 30, name: '2(3) Врати', selected: false},
                    {id: 31, name: '4(5) Врати', selected: false},
                    {id: 32, name: 'LED фарове', selected: false},
                    {id: 33, name: 'Ксенонови фарове', selected: false},
                    {id: 34, name: 'Лети джанти', selected: false},
                    {id: 35, name: 'Металик', selected: false},
                    {id: 36, name: 'Панорамен люк', selected: false},
                    {id: 37, name: 'Спойлери', selected: false},
                    {id: 38, name: 'Теглич', selected: false},
                    {id: 39, name: 'Халогенни фарове', selected: false},
                    {id: 40, name: 'Шибедах', selected: false},
                    
                ]
            },
            'extra_4': {
                name: 'Защита',
                items: [
                    {id: 32, name: 'OFFROAD пакет', selected: false},
                    {id: 33, name: 'Аларма', selected: false},
                    {id: 34, name: 'Брониран', selected: false},
                    {id: 35, name: 'Имобилайзер', selected: false},
                    {id: 36, name: 'Каско', selected: false},
                    {id: 37, name: 'Подсилени стъкла', selected: false},
                    {id: 38, name: 'Централно заключване', selected: false},
                    
                ]
            },
            'extra_5': {
                name: 'Интериор',
                items: [
                    {id: 39, name: 'Велурен салон', selected: false},
                    {id: 40, name: 'Десен волан', selected: false},
                    {id: 41, name: 'Кожен салон', selected: false},
                ]
            },
            'extra_6': {
                name: 'Специализирани',
                items: [
                    {id: 42, name: 'TAXI', selected: false},
                    {id: 43, name: 'За хора с увреждания', selected: false},
                    {id: 44, name: 'Катафалка', selected: false},
                    {id: 45, name: 'Линейка', selected: false},
                    {id: 46, name: 'Учебен', selected: false},
                    {id: 47, name: 'Хладилен', selected: false},
                ]
            },
            'extra_7': {
                name: 'Други',
                items: [
                    {id: 48, name: '7 места', selected: false},
                    {id: 49, name: 'Бартер', selected: false},
                    {id: 50, name: 'Дълга база', selected: false},
                    {id: 51, name: 'Катастрофирал', selected: false},
                    {id: 52, name: 'Къса база', selected: false},
                    {id: 53, name: 'Лизинг', selected: false},
                    {id: 54, name: 'На части', selected: false},
                    {id: 55, name: 'Напълно обслужен', selected: false},
                    {id: 56, name: 'Нов внос', selected: false},
                    {id: 57, name: 'С регистрация', selected: false},
                    {id: 58, name: 'Сервизна книжка', selected: false},
                    {id: 59, name: 'Тунинг', selected: false},
                ]
            }  
        })
    }, [])
    
    return (
        <>
            <form method='POST' action='' className='car-ad-form'>
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
                            }
                        }

                        return (
                            <div className={`field-wrapper ${sizeClasses}`} key={index}>
                                <label className='p-1'>{field.label}
                                    {
                                        fieldType === 'input' ?
                                            <input {...propsObj} /> :
                                        fieldType === 'dropdown' ?
                                            <select {...propsObj} >
                                                {field.addDisabledOption ? <option>{field.addDisabledOption}</option> : ''}
                                                {Object.entries(field.values).map(([value, label], index) => <option value={value} key={index}>{label}</option>)}
                                            </select> :
                                        fieldType === 'textarea' ? 
                                            <textarea rows="5" {...propsObj}></textarea>
                                        : ''
                                    }
                                </label>
                            </div>
                        );
                    })}
                </div>
        
                <div id="cars-extras-container" className='mt-4'>
                    <p className='h5 mb-3'>Избери екстри</p>
                    <ul className="list-group">
                        {Object.entries(carExtras).map(([categoryId, categoryData], groupIndex) => {
                            
                            let selectedExtras = categoryData.items.filter(item => item.selected)

                            return <li className="list-group-item" key={groupIndex} onClick={() => handleExtraModalShow(categoryId)}>
                                <div className='d-flex'>
                                    <div className='w-100'>
                                        <p className='me-2'>
                                            {categoryData.name + ` (${selectedExtras.length} избрани)`}
                                            <small className='d-block text-gray mt-2'>
                                                {selectedExtras.map(item => item.name).join(', ')}
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
                <button className='btn btn-primary my-3'>Публикувай</button>
            </form>

            <CarExtraSelectionModal show={showExtraModal}
                extras={carExtras.hasOwnProperty(openedCategoryId) ? carExtras[openedCategoryId].items : []}
                onHide={handleExtraModalClose}
                onSave={handleExtraModalSave}
            />
        </>
    )
}