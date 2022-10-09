import React from 'react'
import ReactDOM from 'react-dom/client'
import CarsSearchForm from '../components/cars/CarsSearchForm'
import CarsList from '../components/cars/CarsList'

import "../../scss/pages/home.scss"

let Home = {
    'init': () => {
        return (
            document.body.getAttribute('id') === 'home' ?
            [
                ReactDOM
                    .createRoot(document.getElementById('cars-search-container'))
                    .render(<CarsSearchForm />),
            
                ReactDOM
                    .createRoot(document.getElementById('car-ads-listing'))
                    .render(<CarsList />)
            ] : ''
        )
    }
}

export default Home