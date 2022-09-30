import React from 'react';

import "../../../scss/components/car-ads.scss";

export default function CarsList(props) {

    return (
        <div className='row cars-list'>
            {
                props.carsList.map((car, index) => <div key={index} className='col-12 col-sm-6 col-md-4 col-lg-3 p-3'>
                    <div className="card car-ad shadow-sm" >
                        <img src={car.thumbnail} className='card-img-top' alt="..." />
                        <div className='card-body'>
                            <h5 className='card-title'>{car.make + ' ' + car.model}</h5>
                            <p className='card-text'>{`${car.year} ${car.engine} ${car.mileage} ${props.mileageUnit}`}</p>
                        </div>
                    </div>
                </div>)
            }
        </div>
    );
}