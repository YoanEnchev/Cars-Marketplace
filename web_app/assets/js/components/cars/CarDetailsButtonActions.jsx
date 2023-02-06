import React from 'react'

export default function CarDetailsButtonActions({vehicleStatus, acceptUrl, declinetUrl}) {
    return vehicleStatus == 'pending' ? <>
        <form action={acceptUrl} method='POST' className="d-inline-block">
            <button className='btn btn-primary me-3'>Одобри</button>
        </form>
        <form action={declinetUrl} method='POST' className="d-inline-block">
            <button className='btn btn-danger'>Откажи</button>
        </form>
    </> : ''
}