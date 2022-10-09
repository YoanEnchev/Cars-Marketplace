import React, { useState } from 'react'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHeart as faHeartSolid, faPencil } from '@fortawesome/free-solid-svg-icons'
import { faHeart as faHeartRegular } from '@fortawesome/free-regular-svg-icons'

import "../../../scss/components/car-ads.scss"

export default function CarAd(props) {

    const car = props.car
    const [isInWishlist, setIsInWishlist] = useState(car.isInWishlist)
    
    function onClickWishlistAction(e) {
        e.preventDefault() // Prevent opening the car ad link.
    
        setIsInWishlist(prevIsInWishlist => !prevIsInWishlist)
    }
    
    function onClickEditAction(e) {
        e.preventDefault() // Prevent opening the car ad link.
    
        window.location.href = car.pageUrl
    }

    return (
        <a className="card car-ad shadow-sm" href={car.pageUrl}>
            <div className='actions'>
                <div className='wishlist-action' key='wishlist' onClick={onClickWishlistAction}>
                    <FontAwesomeIcon icon={isInWishlist ? faHeartSolid : faHeartRegular} />
                </div>
                
                {car.isEditable ? 
                <div className='edit-action' key='edit' onClick={onClickEditAction}>
                    <FontAwesomeIcon icon={faPencil} />
                </div> : ''}
            </div>
            
            <img src={car.thumbnail} className='card-img-top' alt={car.make + ' ' + car.model} />
            <div className='card-body'>
                <p className='card-title h5 text-black'>{car.make + ' ' + car.model + ' ' + car.modification}</p>
                <div className="divider"></div>
                <p className='card-text text-black'>{`${car.year} ${car.engine} ${car.mileage} ${props.mileageUnit}`}</p>
                <p className='text-muted'>{car.description}</p>
                <p className='mt-2 text-black'>{car.publisher.name}, {car.publisher.location}</p>
            </div>
        </a>
    )
}