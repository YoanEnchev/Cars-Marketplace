import Modal from 'react-bootstrap/Modal'

import React, { useState } from 'react'
import { Navigation } from "swiper"
import { Swiper, SwiperSlide } from "swiper/react"

export default function ThumbnailSliderModal(props) {

    const [swiper, setSwiper] = useState(null) // useState<Swiper>
  
    function handleClose() {
      props.onHide()
    }
  
    return (
      <Modal show={props.show} onHide={handleClose} className='thumbnail-slider-modal'>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
        <Swiper className='car-images-slider-modal'
            navigation={true} 
            modules={[Navigation]}
            onSwiper={(swiper) => setSwiper(swiper)}
            onSlideChange={() => {
              (swiper !== null &&  swiper.activeIndex ) ? props.onSlideChange(swiper.activeIndex) : ''
            }}
            initialSlide={props.activeSliderIndex}
        >
            
            {props.thumbnails.map((thumbnailUrl, index) => <SwiperSlide key={index}>
                <img src={thumbnailUrl} className="w-100" />
            </SwiperSlide>)}
        </Swiper>
        </Modal.Body>
      </Modal>
    )
  }