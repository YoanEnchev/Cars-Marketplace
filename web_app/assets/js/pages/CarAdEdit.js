import React from 'react'
import ReactDOM from 'react-dom/client'
import CarAdForm from '../components/cars/CarCreateEditForm/CarAdForm'

let CarAdEdit = {
    'init': () => {
        document.body.getAttribute('id') === 'car-ad-edit' ?
            ReactDOM
                .createRoot(document.getElementById('car-ad-form'))
                .render(<CarAdForm
                        staticFormDataUrl={fromPython.staticFormDataUrl} 
                        actionUrl={fromPython.carEditUrl}
                        vehicleParams={fromPython.vehicleParams}
                        currentYear={fromPython.currentYear}
                        buttonText='Редактирай' />) : ''
    }
}

export default CarAdEdit