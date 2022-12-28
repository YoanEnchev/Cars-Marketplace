import React from 'react'
import ReactDOM from 'react-dom/client'
import CarAdForm from '../components/cars/CarCreateEditForm/CarAdForm'

let CarAdEdit = {
    'init': () => {
        document.body.getAttribute('id') === 'car-ad-edit' ?
            ReactDOM
                .createRoot(document.getElementById('car-ad-form'))
                .render(<CarAdForm
                        staticFormDataUrl={fromPHP.staticFormDataUrl} 
                        actionUrl={fromPHP.carEditUrl}
                        vehicleParams={fromPHP.vehicleParams}/>) : ''
    }
}

export default CarAdEdit