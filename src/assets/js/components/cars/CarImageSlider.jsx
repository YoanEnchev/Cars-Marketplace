import React, {useState, useEffect} from 'react'
import { Navigation, Pagination } from "swiper"
import { Swiper, SwiperSlide } from "swiper/react"


import "../../../scss/components/car-slider.scss"

import "swiper/css"
import "swiper/css/navigation"
import "swiper/css/pagination"

export default function CarImageSlider(props) {
    //const [cars, setCars] = useState([])
    const thumbnails = props.thumbnails

    return <Swiper className='car-images-slider' 
            navigation={true}
            pagination={{clickable: true}} 
            modules={[Navigation, Pagination]} >
            
            {thumbnails.map((thumbnailUrl, index) => 
                <SwiperSlide key={index}>
                    <img src={thumbnailUrl} className="w-100" />
                </SwiperSlide>)}
        </Swiper>  
}