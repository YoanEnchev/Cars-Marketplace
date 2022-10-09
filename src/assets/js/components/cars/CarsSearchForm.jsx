import React from 'react';

export default function CarsSearchForm() {
    return (
        <form method='GET' action=''>
            <div className="row gy-3">
                <div className="col-6 col-md-3">
                    <label htmlFor="make" className="mb-2">Марка</label>
                    <select className="form-select form-select" name="make" id="make">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="col-6 col-md-3">
                    <label htmlFor="model" className="mb-2">Модел</label>
                    <select className="form-select form-select" name="model" id="model">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="col-6 col-md-3">
                    <label htmlFor="region" className="mb-2">Област</label>
                    <select className="form-select form-select" name="region" id="region">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="col-6 col-md-3">
                    <label htmlFor="subregion" className="mb-2">Населено място</label>
                    <select className="form-select form-select" name="subregion" id="subregion">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>

            <div className="row mt-0 gy-3">
                <div className="col-6 col-md-3">
                    <label htmlFor="max_price" className="mb-2">Максимална цена</label>
                    <input className="form-control form-control" type="number" id="max_price" min="0" max="10000000"/>
                </div>
                <div className="col-6 col-md-3">
                    <label htmlFor="year" className="mb-2">Година</label>
                    <select className="form-select form-select" name="year" id="year">
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div className="col-12 col-md-6">
                    <label htmlFor="order-by" className="mb-2">Подреди по</label>
                    <select className="form-select form-select" name="order-by" id="order-by">
                        <option value="price_asc">Цена - Възходящо</option>
                        <option value="price_desc">Цена - Низходящо</option>
                        <option value="year_asc">Година На Производство - Възходящо</option>
                        <option value="year_desc">Година На Производство - Низходящо</option>
                    </select>
                </div>
            </div>

            <div className="row mt-0 gy-3">
                <div className="col-6 col-md-3">
                    <label htmlFor="engine-type" className="mb-2">Двигател</label>
                    <select className="form-select form-select" name="engine_type" id="engine-type">
                        <option value="1">Бензинов</option>
                        <option value="1">Газ / Бензин</option>
                        <option value="2">Дизелов</option>
                        <option value="3">Електрически</option>
                        <option value="4">Хибриден</option>
                    </select>
                </div>

                <div className="col-6 col-md-3">
                    <label htmlFor="gearbox" className="mb-2">Скоростна Кутия</label>
                    <select className="form-select form-select" name="gearbox" id="gearbox">
                        <option value="1">Ръчна</option>
                        <option value="2">Автоматична</option>
                        <option value="3">Полуавтоматична</option>
                    </select>
                </div>

                <div className='col-12 col-md-6 d-flex mt-4'>
                    <button className='btn btn-primary w-100 mt-auto'>
                        <p className='h6'>Търси</p>
                    </button>
                </div>
            </div>
        </form>
    )
}