import React from 'react'
import ReactDOM from 'react-dom/client'
import CarsList from '../components/cars/CarsList'

let CarListing = {
    'init': () => {

        if (document.body.getAttribute('id') === 'car-list') {
            
            const [siteUrl, ...paramsArr] = window.location.href.split('?')

            ReactDOM
                .createRoot(document.getElementById('car-ads-listing'))
                .render(<CarsList showPaginator={true} 
                    apiUrl={fromPython.vehicleListDataUrl + (paramsArr.length > 0 ? '?' + paramsArr.join('&') : '')}
                    page={(new URL(window.location.href)).searchParams.get('page') || 1}
                    />)
        }
    }
}

export default CarListing