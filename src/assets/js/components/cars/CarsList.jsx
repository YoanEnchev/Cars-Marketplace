import React from 'react';
import CarAd from "./CarAd" 

import "../../../scss/components/car-ads.scss";

export default function CarsList(props) {

    return (
        <div className='row cars-list'>
            {
                props.carsList.map((car, index) => <div key={index} className='col-12 col-sm-6 col-md-4 col-lg-3 p-3'>
                    <CarAd car={car} mileageUnit={props.mileageUnit} />
                </div>)
            }
        </div>
    );
}