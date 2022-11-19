import React, {useState, useEffect} from 'react'
import CarAd from "./CarAd" 

import "../../../scss/components/car-ads.scss"

export default function CarsList(props) {
    const [cars, setCars] = useState([])

    useEffect(() => {
        console.log(props.apiURL);
        let cars = [
            {
                thumbnail: 'https://g1-bg.cars.bg/2021-10-30_2/617d3d02ffd9427c8b3e6987o.jpg',
                make: 'Mercedes',
                model: 'C Class',
                modification: '1.6 CDI',
                mileage: 200000,
                year: 2003,
                engine: 'Diesel',
                price: 5000,
                description: 'Сменени ролки, ремъци и други неща. Намира се в <някъв град>. Сизипинг 123',
                pageUrl: 'https://www.youtube.com/watch?v=a-D_oKGjuo4&t=3190s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                editPageUrl: 'https://www.youtube.com/watch?v=7SGWPwfyweI&t=313s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                publisher: {
                    type: 'Private Person',
                    name: 'Стефчо',
                    location: 'Габрово'
                },
                isInWishlist: false,
                isEditable: false
            },
            {
                thumbnail: 'https://g1-bg.cars.bg/2022-09-20_2/632992c5213a806df608bd96o.jpg',
                make: 'Dacia',
                model: 'Twigo',
                modification: '1.4i',
                mileage: 120000,
                year: 2014,
                engine: 'Benzine',
                price: 15000,
                description: 'Много добро качество',
                pageUrl: 'https://www.youtube.com/watch?v=a-D_oKGjuo4&t=3190s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                editPageUrl: 'https://www.youtube.com/watch?v=7SGWPwfyweI&t=313s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                publisher: {
                    type: 'Private Person',
                    name: 'Данел',
                    location: 'Велико Търново'
                },
                isInWishlist: true,
                isEditable: false
            },
            {
                thumbnail: 'https://g1-bg.cars.bg/2022-09-26_2/6331db43c1e6dc464c097742o.jpg',
                make: 'Audi',
                model: 'A8',
                modification: '2.0 TDI',
                mileage: 160000,
                year: 2016,
                engine: 'Benzine',
                price: 22000,
                description: 'Много добро качество',
                pageUrl: 'https://www.youtube.com/watch?v=a-D_oKGjuo4&t=3190s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                editPageUrl: 'https://www.youtube.com/watch?v=7SGWPwfyweI&t=313s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                publisher: {
                    type: 'Legal entity',
                    name: 'GC Auto',
                    location: 'София'
                },
                isInWishlist: false,
                isEditable: true
            },
            {
                thumbnail: 'https://g1-bg.cars.bg/2022-09-26_2/6331db43c1e6dc464c097742o.jpg',
                make: 'Audi',
                model: 'A8',
                modification: '2.0 TDI',
                mileage: 160000,
                year: 2016,
                engine: 'Benzine',
                price: 22000,
                description: 'Много добро качество',
                pageUrl: 'https://www.youtube.com/watch?v=a-D_oKGjuo4&t=3190s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                editPageUrl: 'https://www.youtube.com/watch?v=7SGWPwfyweI&t=313s&ab_channel=%D0%9A%D0%BE%D0%BC%D0%B5%D0%B4%D0%B8%D0%9A%D0%BB%D1%83%D0%B1%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%2FComedyClubPodcast',
                publisher: {
                    type: 'Legal entity',
                    name: 'RS AI++',
                    location: 'Бургас'
                },
                isInWishlist: true,
                isEditable: true
            },
        ]

        setCars([...cars, ...cars])
    }, [])

    return (
        <div className='row cars-list'>
            {
                cars.map((car, index) => <div key={index} className='col-12 col-sm-6 col-md-4 col-lg-3 p-3'>
                    <CarAd car={car} mileageUnit='км' />
                </div>)
            }
        </div>
    )
}