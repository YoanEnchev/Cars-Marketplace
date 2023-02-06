import React from 'react'
import ReactDOM from 'react-dom/client'
import CarsList from '../components/cars/CarsList'

let MyAdsListing = {
    'init': () => {

        if (document.body.getAttribute('id') === 'my-ads-list') {
            
            ReactDOM
                .createRoot(document.getElementById('my-ads-listing'))
                .render(<CarsList showPaginator={true} 
                    apiUrl={fromPython.vehicleListDataUrl + `?context=my_ads&publisher_id=${fromPython.userID}`}
                    page={(new URL(window.location.href)).searchParams.get('page') || 1}
                    />)
        }
    }
}

export default MyAdsListing