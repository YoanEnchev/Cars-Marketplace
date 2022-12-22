import React, { useState } from 'react'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHeart as faHeartSolid, faPencil } from '@fortawesome/free-solid-svg-icons'
import { faHeart as faHeartRegular } from '@fortawesome/free-regular-svg-icons'

import "../../../scss/components/car-ads.scss"

export default function CarAd(props) {

    const car = props.car
    const makeTitle = car.make.title;
    const modelTitle = car.model.title;
    const [isInWishlist, setIsInWishlist] = useState(car.isInWishlist)
    
    function onClickWishlistAction(e) {
        e.preventDefault() // Prevent opening the car ad link.
    
        setIsInWishlist(prevIsInWishlist => !prevIsInWishlist)
    }
    
    function onClickEditAction(e) {
        e.preventDefault() // Prevent opening the car ad link.
    
        window.location.href = car.edit_page
    }

    return (
        <a className="card car-ad shadow-sm" href={car.detail_page}>
            <div className='actions'>
                {car.is_in_wishlist ?
                <div className='wishlist-action' key='wishlist' onClick={onClickWishlistAction}>
                    <FontAwesomeIcon icon={isInWishlist ? faHeartSolid : faHeartRegular} />
                </div> : ''}
                
                {car.is_editable ? 
                <div className='edit-action' key='edit' onClick={onClickEditAction}>
                    <FontAwesomeIcon icon={faPencil} />
                </div> : ''}
            </div>
            
            <img src={car.thumbnail_url} className='card-img-top' alt={makeTitle + ' ' + modelTitle} />
            <div className="offer-price-badge ms-auto">
                <span>{car.price} лв.</span>
            </div>
            
            <div className='card-body pt-0'>
                <p className='card-title h5 text-black'>{makeTitle + ' ' + modelTitle + ' ' + car.modification}</p>
                <div className="divider"></div>
                <p className='card-text text-black'>{`${car.manufacture_year} ${car.fuel_type.title} ${car.mileage} ${props.mileageUnit}`}</p>
                <p className='text-muted description'>{car.description}</p>
                <p className='mt-2 text-black'>{car.publisher.first_name}, {car.settelment.title}</p>
            </div>
        </a>
    )
}