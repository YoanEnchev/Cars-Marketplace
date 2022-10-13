import React from 'react'

import "../../../scss/components/car-ad-form.scss"
import ImageUpload from './ImageUpload'

let carExtras = ['Климатик', 'Климатроник', 'Кожен салон', 'Ел.стъкла', 'Ел.огледала', 'Ел.седалки', 'Подгряване на седалки', 'Шибедах', 'Стерео уредба', 'Алуминиеви джанти', 'DVD/TV', 'Мултифункционален волан', '4x4', 'ABS', 'ESP', 'Airbag', 'Ксенонови фарове', 'Халогенни фарове', 'ASR/Тракшън контрол', 'Парктроник', 'Аларма', 'Имобилайзер', 'Центр. заключване', 'Застраховка', 'Брониран', 'Старт-Стоп система', 'Безключово палене', 'Типтроник/Мултитроник', 'Автопилот', 'Серво управление', 'Бордови компютър', 'Сервизна книжка', 'Гаранция', 'Навигационна система', 'Десен волан', 'Тунинг', 'Панорамен покрив', 'TAXI', 'Ретро', 'Теглич', '7 места (6+1)', 'Хладилен']

export default function CarAdForm(props) {
    return (
        <form method='GET' action='' className='car-ad-form'>
            <div className="row gy-3">
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="make" className="mb-2">Марка</label>
                    <select className="form-select form-select" name="make" id="make">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="model" className="mb-2">Модел</label>
                    <select className="form-select form-select" name="model" id="model">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="modification" className="mb-2">Модификация</label>
                    <input className="form-control" id="modification" />
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="engine_type" className="mb-2">Тип двигател</label>
                    <select className="form-select form-select" name="engine_type" id="engine_type">
                        <option></option>
                        <option value="1">Бензинов</option>
                        <option value="2">Газ/Бензин</option>
                        <option value="3">Хибриден</option>
                        <option value="3">Електрически</option>
                    </select>
                </div>


                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="hp" className="mb-2">Мощност (к.с.)</label>
                    <input className="form-control" id="hp" name="hp" />
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="euro_standart" className="mb-2">Евростандарт</label>
                    <select className="form-select form-select" name="euro_standart" id="euro_standart">
                        <option value="1">Евро 1</option>
                        <option value="1">Евро 2</option>
                        <option value="1">Евро 3</option>
                        <option value="1">Евро 4</option>
                        <option value="1">Евро 5</option>
                        <option value="1">Евро 6</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="gearbox" className="mb-2">Скоростна кутия</label>
                    <select className="form-select form-select" name="gearbox" id="gearbox">
                        <option value="1">Ръчна</option>
                        <option value="1">Автоматична</option>
                        <option value="1">Полуавтоматична</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="gearbox" className="mb-2">Категория</label>
                    <select className="form-select form-select" name="category" id="gearbox">
                        <option value="Ван">Ван</option>
                        <option value="Джип">Джип</option>
                        <option value="Кабрио">Кабрио</option>
                        <option value="Комби">Комби</option>
                        <option value="Купе">Купе</option>
                        <option value="Миниван">Миниван</option>
                        <option value="Пикап">Пикап</option>
                        <option value="Седан">Седан</option>
                        <option value="Стреч лимузина">Стреч лимузина</option>
                        <option value="Хечбек">Хечбек</option>
                    </select>
                </div>


                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="price" className="mb-2">Цена</label>
                    <input className="form-control" id="price" name="price" />
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="currency" className="mb-2">Валута</label>
                    <select className="form-select" name="currency" id="engine_type">
                        <option value="BGN">лв.</option>
                        <option value="USD">USD</option>
                        <option value="EURO">EURO</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="manufacture_year" className="mb-2">Година на производство</label>
                    <input className="form-control" name="manufacture_year" id="manufacture_year" />
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="mileage" className="mb-2">Пробег</label>
                    <input className="form-control" name="mileage" id="mileage" />
                </div>
                

                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="color" className="mb-2">Цвят</label>
                    <select className="form-select" name="color" id="color">
                        <option value="1">Употребяван</option>
                        <option value="2">Нов</option>
                        <option value="3">За части</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="region" className="mb-2">Област</label>
                    <select className="form-select form-select" name="region" id="region">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="subregion" className="mb-2">Населено място</label>
                    <select className="form-select form-select" name="subregion" id="subregion">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="field-wrapper col-6 col-md-3">
                    <label htmlFor="shape" className="mb-2">Състояние</label>
                    <select className="form-select" name="shape" id="shape">
                        <option value="1">Употребяван</option>
                        <option value="2">Нов</option>
                        <option value="3">За части</option>
                    </select>
                </div>
            </div>

            <div className="accordion mt-4" id="cars-extras-container">
                <div className="accordion-item">
                  <h2 className="accordion-header">
                    <button className="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#cars-extras" aria-expanded="true" aria-controls="cars-extras">
                      Избери Екстри
                    </button>
                  </h2>
                  <div id="cars-extras" className="accordion-collapse collapse show" data-bs-parent="#cars-extras-container">
                    <div className="accordion-body">
                      {carExtras.map((carExtra, index) => <div className="form-check" key={index}>
                          <label className="form-check-label" >
                            <input className="form-check-input" type="checkbox" value={index} />
                            {carExtra}
                          </label>
                        </div>)}
                    </div>
                  </div>
                </div>
            </div>
            <div className='mt-4'>
                <ImageUpload />
            </div>
            <button className='btn btn-primary my-3'>Публикувай</button>
        </form>
    )
}