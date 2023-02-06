import React, { useState, useReducer } from 'react'
import { Navigation, Pagination } from 'swiper'
import { Swiper, SwiperSlide } from 'swiper/react'
import ThumbnailSliderModal from './ThumbnailSliderModal'


import "../../../scss/components/car-slider.scss"
import "../../../scss/components/swiper-navigation.scss"

import "swiper/css"
import "swiper/css/navigation"
import "swiper/css/pagination"

export default function CarImageSlider(props) {
    
    const [swiper, setSwiper] = useState(null) // useState<Swiper>
    const [showThumbnailModal, setShowThumbnailModal] = useState(false)
    
    // Changing active slide by using swiper.slideTo does not update component state.
    // To do the rerendering, forceUpdate needs to be used.
    // Use forceUpdate whenever slide is changed.
    const [, forceUpdate] = useReducer(x => x + 1, 0);

    const thumbnails = props.thumbnails

    function changeSlide(index) {
        swiper.slideTo(index)
    }

    function openThumbnailModal() {
        if (document.body.clientWidth > 700) {
            setShowThumbnailModal(true)
        }
    }

    function closeThumbnailModal() {
        setShowThumbnailModal(false)
    }

    return <> 
        <Swiper className='car-images-slider'
            navigation={true}
            pagination={{clickable: true}} 
            modules={[Navigation, Pagination]}
            onSwiper={(swiper) => setSwiper(swiper)}
            onSlideChange={forceUpdate}
        >
            
            {thumbnails.map((thumbnailUrl, index) => <SwiperSlide key={index}>
                <img src={thumbnailUrl} className="w-100 slide-img" onClick={openThumbnailModal} />
            </SwiperSlide>)}
        </Swiper>
        <div className='thumbnail-pagination'>
            {thumbnails.map((thumbnailUrl, index) => {

                // Assume active slide is at index 0 before it's initialized.
                let activeSliderIndex = swiper === null ? 0 : swiper.activeIndex
                let isActive = activeSliderIndex === index
                
                // Add background blending to the pagination image corresponding to the active slide.
                let blendPercentage = isActive ? 34 : 0

                return <div onClick={() => changeSlide(index)}
                    key={index}
                    className={'thumbnail-item d-inline-block mb-1 me-1' + (isActive ? ' active' : '')} 
                    style={{background: `url(${thumbnailUrl}) rgb(21 21 34 / ${blendPercentage}%)`}} >
                </div>
            })}
        </div>

        <ThumbnailSliderModal thumbnails={thumbnails}
            show={showThumbnailModal}
            onHide={closeThumbnailModal}
            onSlideChange={changeSlide}
            activeSliderIndex={swiper === null ? 0 : swiper.activeIndex}
         />
    </>
}