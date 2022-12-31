import React from 'react'
import ReactDOM from 'react-dom/client'
import CarDetailsButtonActions from '../components/cars/CarDetailsButtonActions'
import CarImageSlider from '../components/cars/CarImageSlider'

let CarDetails = {
    'init': () => {

        if (document.body.getAttribute('id') === 'car-ad-details') {
            ReactDOM
                .createRoot(document.getElementById('car-thumbnail-slider'))
                .render(<CarImageSlider thumbnails={fromPHP.imagesUrls} />)
        
            const adminActionsContainer = document.querySelector('.admin-actions-container')
            if (adminActionsContainer) {
                // If admin has opened the page.
                ReactDOM
                    .createRoot(adminActionsContainer)
                    .render(<CarDetailsButtonActions vehicleStatus={fromPHP.vehicleStatus}
                        acceptUrl={fromPHP.acceptUrl}
                        declinetUrl={fromPHP.declinetUrl} />)
            }
        }
    }
}

export default CarDetails