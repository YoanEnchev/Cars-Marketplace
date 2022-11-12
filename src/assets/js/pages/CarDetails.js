import React from 'react'
import ReactDOM from 'react-dom/client'
import CarImageSlider from '../components/cars/CarImageSlider'

let CarDetails = {
    'init': () => {

        const thumbnailsCount = 10
        let thumbnails = []

        for (let i = 1; i <= thumbnailsCount; i++) {
            thumbnails.push(`http://localhost:5000/static/imgs/cars/1/${i}.jpg`)
        }

        document.body.getAttribute('id') === 'car-ad-details' ?
            ReactDOM
                .createRoot(document.getElementById('car-thumbnail-slider'))
                .render(<CarImageSlider thumbnails={thumbnails} />) : ''
    }
}

export default CarDetails