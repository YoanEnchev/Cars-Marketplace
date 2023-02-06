import React from 'react'
import ReactDOM from 'react-dom/client'
import CarsSearchForm from '../components/cars/CarsSearchForm'
import CarsList from '../components/cars/CarsList'

import "../../scss/pages/home.scss"

let Home = {
    'init': () => {
        document.body.getAttribute('id') === 'home' ?
        [
            ReactDOM
                .createRoot(document.getElementById('cars-search-container'))
                .render(<CarsSearchForm staticFormDataUrl={fromPython.staticFormDataUrl}
                    currentYear={fromPython.currentYear} />),
        
            ReactDOM
                .createRoot(document.getElementById('car-ads-listing'))
                .render(<CarsList showPaginator={false}
                    apiUrl={fromPython.vehicleListDataUrl}
                    page={1}
                    />)
        ] : ''
    }
}

export default Home