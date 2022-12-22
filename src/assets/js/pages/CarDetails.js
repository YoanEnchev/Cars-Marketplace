import React from 'react'
import ReactDOM from 'react-dom/client'
import CarImageSlider from '../components/cars/CarImageSlider'

let CarDetails = {
    'init': () => {

        document.body.getAttribute('id') === 'car-ad-details' ?
            ReactDOM
                .createRoot(document.getElementById('car-thumbnail-slider'))
                .render(<CarImageSlider thumbnails={fromPHP.imagesUrls} />) : ''
    }
}

export default CarDetails