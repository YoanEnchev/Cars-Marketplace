import React from 'react'
import ReactDOM from 'react-dom/client'
import CarsList from '../components/cars/CarsList'

let CarListing = {
    'init': () => {
        document.body.getAttribute('id') === 'car-list' ?
            ReactDOM
                .createRoot(document.getElementById('car-ads-listing'))
                .render(<CarsList />)
            : ''
    }
}

export default CarListing