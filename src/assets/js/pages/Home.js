import React from 'react';
import ReactDOM from 'react-dom/client';
import CarsSearchForm from '../components/cars/CarsSearchForm';
import CarsList from '../components/cars/CarsList';

let Home = {
    'init': () => {

        if (document.body.getAttribute('id') === 'home') {
            
            ReactDOM
                .createRoot(document.getElementById('cars-search-container'))
                .render(<CarsSearchForm />);
                
            ReactDOM
                .createRoot(document.getElementById('car-ads-listing'))
                .render(<CarsList carsList={[
                    {
                        thumbnail: 'https://g1-bg.cars.bg/2021-10-30_2/617d3d02ffd9427c8b3e6987o.jpg',
                        make: 'Mercedes',
                        model: 'C Class',
                        mileage: 200000,
                        year: 2003,
                        engine: 'Diesel',
                        price: 5000,
                        description: 'Сменени ролки, ремъци и други неща. Намира се в <някъв град>. Сизипинг 123'
                    },
                    {
                        thumbnail: 'https://g1-bg.cars.bg/2022-09-20_2/632992c5213a806df608bd96o.jpg',
                        make: 'Dacia',
                        model: 'Twigo',
                        mileage: 120000,
                        year: 2014,
                        engine: 'Benzine',
                        price: 15000,
                        description: 'Много добро качество'
                    },
                    {
                        thumbnail: 'https://g1-bg.cars.bg/2022-09-26_2/6331db43c1e6dc464c097742o.jpg',
                        make: 'Audi',
                        model: 'A8',
                        mileage: 160000,
                        year: 2016,
                        engine: 'Benzine',
                        price: 22000,
                        description: 'Много добро качество'
                    },
                    {
                        thumbnail: 'https://g1-bg.cars.bg/2022-09-26_2/6331db43c1e6dc464c097742o.jpg',
                        make: 'Audi',
                        model: 'A8',
                        mileage: 160000,
                        year: 2016,
                        engine: 'Benzine',
                        price: 22000,
                        description: 'Много добро качество'
                    },
                ]}
                mileageUnit='км' />);
        }
    }
}

export default Home;