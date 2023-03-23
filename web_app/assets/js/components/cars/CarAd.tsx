import React, { useState, useRef, FC, MouseEvent, ChangeEvent } from 'react'

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHeart as faHeartSolid, faPencil, faTrashCan } from '@fortawesome/free-solid-svg-icons'
import { faHeart as faHeartRegular } from '@fortawesome/free-regular-svg-icons'
import CarAdInterfaceProps from '../../common/interfaces/properties/CarAdInterfaceProps'

import "../../../scss/components/car-ads.scss"

const CarAd: FC<CarAdInterfaceProps> = ({car, mileageUnit}) => {

    const status: string = car.status
    const makeTitle: string = car.make.title;
    const modelTitle: string = car.model.title;

    const deleteForm = useRef<HTMLFormElement>(null)
    const [isInWishlist, setIsInWishlist] = useState<boolean>(car.is_in_wishlist)
    
    function onClickWishlistAction(e: MouseEvent<HTMLDivElement>) {
        e.preventDefault() // Prevent opening the car ad link.
    
        setIsInWishlist(prevIsInWishlist => !prevIsInWishlist)
    }
    
    function onClickEditAction(e: MouseEvent<HTMLDivElement>) {
        e.preventDefault() // Prevent opening the car ad link.
    
        window.location.href = car.edit_page
    }

    function onClickDeleteIcon(e: MouseEvent<HTMLOrSVGElement>) {
        e.preventDefault() // Prevent opening the car ad link.


        if (confirm('Сигурни ли сте че искате да изтриете обявата?')) {
            // Continue submiting.
            deleteForm.current.submit();
        }
    }

    return (
        <a className={"card car-ad shadow-sm " + status} href={car.detail_page}>
            <div className='actions'>
                
                {/* For future development:
                <div className='wishlist-action' key='wishlist' onClick={onClickWishlistAction}>
                    <FontAwesomeIcon icon={isInWishlist ? faHeartSolid : faHeartRegular} />
                </div>*/}
                
                {car.published_by_current_user ?
                    <> 
                        <div className='edit-action' onClick={onClickEditAction}>
                            <FontAwesomeIcon icon={faPencil} />
                        </div>
                        <div className='delete-action'>
                            <form action={car.delete_action_url} method="POST" ref={deleteForm}>
                                <FontAwesomeIcon icon={faTrashCan} onClick={onClickDeleteIcon} />
                            </form>
                        </div>
                    </> 
                : ''}
            </div>
            
            <img src={car.thumbnail_url} className='card-img-top' alt={makeTitle + ' ' + modelTitle} />
            <div className="offer-price-badge ms-auto">
                <span>{car.price} лв.</span>
            </div>
            
            <div className='card-body pt-0'>
                {status === 'pending' ? <p>Обявата изчаква одобрение.</p> : 
                    status === 'declined' ? <p>Обявата не беше одобрена поради неправилно съдържание в нея. Редактирайте обявата и премахнете неподходящото съдържание или се свържете с администратора на сайта за повече детайли.</p> :
                    <>
                        <p className='card-title h5 text-black'>{makeTitle + ' ' + modelTitle + ' ' + car.modification}</p>
                        <div className="divider"></div>
                        <p className='card-text text-black'>{`${car.manufacture_year} ${car.fuel_type.title} ${car.mileage} ${mileageUnit}`}</p>
                        <p className='text-muted description'>{car.description}</p>
                        <p className='mt-2 text-black'>{car.publisher.first_name}, {car.settelment.title}</p>
                    </>
                }
            </div>
        </a>
    )
}

export default CarAd