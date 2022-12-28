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
                .render(<CarsSearchForm staticFormDataUrl={fromPHP.staticFormDataUrl}
                    currentYear={fromPHP.currentYear} />),
        
            ReactDOM
                .createRoot(document.getElementById('car-ads-listing'))
                .render(<CarsList showPaginator={false}
                    apiUrl={fromPHP.vehicleListDataUrl}
                    page={1}
                    />)
        ] : ''
    }
}

export default Home