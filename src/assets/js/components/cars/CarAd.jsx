import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faHeart as faHeartSolid, faPencil } from '@fortawesome/free-solid-svg-icons';
import { faHeart as faHeartRegular } from '@fortawesome/free-regular-svg-icons';

import "../../../scss/components/car-ads.scss";

class CarAd extends React.Component {

    render() {

        let car = this.props.car;

        return (
            <a className="card car-ad shadow-sm" >
                <div className='actions'>
                    <div className='wishlist-action'>
                        <FontAwesomeIcon icon={faHeartSolid} />
                    </div>
                    <div className='edit-action'>
                        <FontAwesomeIcon icon={faPencil} />
                    </div>
                </div>
                
                <img src={car.thumbnail} className='card-img-top' alt="..." />
                <div className='card-body'>
                    <p className='card-title h5 text-black'>{car.make + ' ' + car.model + ' ' + car.modification}</p>
                    <div className="divider"></div>
                    <p className='card-text text-black'>{`${car.year} ${car.engine} ${car.mileage} ${this.props.mileageUnit}`}</p>
                    <p className='text-muted'>{car.description}</p>
                    <p className='mt-2 text-black'>{car.publisher.name}, {car.publisher.location}</p>
                </div>
            </a>
        );
    }
}

export default CarAd;