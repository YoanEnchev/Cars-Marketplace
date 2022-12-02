import React from 'react'
import ReactDOM from 'react-dom/client'
import CarAdForm from '../components/cars/CarCreateEditForm/CarAdForm'

let CarAdCreation = {
    'init': () => {
        document.body.getAttribute('id') === 'car-ad-creation' ?
            ReactDOM
                .createRoot(document.getElementById('car-ad-form'))
                .render(<CarAdForm actionUrl={fromPHP.carCreationUrl}/>) : ''
    }
}

export default CarAdCreation