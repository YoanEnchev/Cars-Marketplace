import React, {FC} from 'react'
import CarDetailsButtonActionsProps from '../../common/interfaces/properties/CarDetailsButtonActionsProps';

const CarDetailsButtonActions: FC<CarDetailsButtonActionsProps> = ({vehicleStatus, acceptUrl, declinetUrl}) => {
    return <>
        {vehicleStatus == 'pending' ? <>
            <form action={acceptUrl} method='POST' className="d-inline-block">
                <button className='btn btn-primary me-3'>Одобри</button>
            </form>
            <form action={declinetUrl} method='POST' className="d-inline-block">
                <button className='btn btn-danger'>Откажи</button>
            </form> </> : ''}
    </>
}

export default CarDetailsButtonActions;