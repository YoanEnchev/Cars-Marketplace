import Modal from 'react-bootstrap/Modal'

import React, { useState, FC } from 'react'
import { Navigation, Swiper as SwiperInterface } from "swiper"
import { Swiper, SwiperSlide } from "swiper/react"
import ThumbnailSliderModalProps from '../../common/interfaces/properties/ThumbnailSliderModalProps'

 const ThumbnailSliderModal: FC<ThumbnailSliderModalProps> = (props) => {

    const [swiper, setSwiper] = useState<SwiperInterface>(null)
  
    function handleClose(): void {
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
            
            {props.thumbnails.map((thumbnailUrl: string, index: number) => <SwiperSlide key={index}>
                <img src={thumbnailUrl} className="w-100" />
            </SwiperSlide>)}
        </Swiper>
        </Modal.Body>
      </Modal>
    )
  }

  export default ThumbnailSliderModal