import React from 'react';

import "../../../scss/components/car-ads.scss";

export default function CarsList(props) {

    return (
        <div className='row cars-list'>
            {
                props.carsList.map((car, index) => <div key={index} className='col-12 col-sm-6 col-md-4 col-lg-3 p-3'>
                    <a className="card car-ad shadow-sm" >
                        <img src={car.thumbnail} className='card-img-top' alt="..." />
                        <div className='card-body'>
                            <p className='card-title h5 text-black'>{car.make + ' ' + car.model + ' ' + car.modification}</p>
                            <div className="divider"></div>
                            <p className='card-text text-black'>{`${car.year} ${car.engine} ${car.mileage} ${props.mileageUnit}`}</p>
                            <p className='text-muted'>{car.description}</p>
                            <p className='mt-2 text-black'>{car.publisher.name}, {car.publisher.location}</p>
                        </div>
                    </a>
                </div>)
            }
        </div>
    );
}