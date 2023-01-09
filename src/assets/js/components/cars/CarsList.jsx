import React, {useState, useEffect} from 'react'
import CarAd from "./CarAd" 

import "../../../scss/components/car-ads.scss"
import Paginator from '../paginator/Paginator';

export default function CarsList({showPaginator, apiUrl, page}) {
    
    const [cars, setCars] = useState([])
    const [totalPages, setTotalPages] = useState(1)
    const [currentPage, setCurrentPage] = useState(page)

    useEffect(() => {
        
        const urlObj = new URL(apiUrl);
        urlObj.searchParams.set('page', currentPage)

        fetch(urlObj.href)
            .then(response => response.json())
            .then((json) => {
                setCars(json.items)
                setTotalPages(json.total_pages)
            })
    }, [currentPage])

    return <>
        <div className='row cars-list'>
            {cars.length === 0 ? <p className='h3 mt-5 text-center'>Няма обяви</p> :
                cars.map((car, index) => <div key={index} className='col-12 col-sm-6 col-md-4 col-lg-3 p-3'>
                    <CarAd car={car} mileageUnit='км' />
                </div>)
            }
        </div>
        
        
        {(showPaginator && totalPages > 1) ? <Paginator totalPages={totalPages}
            currentPage={currentPage}
            onPageChange={setCurrentPage}
        /> : ''}
    </>
}