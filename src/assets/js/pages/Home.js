import React from 'react';
import ReactDOM from 'react-dom/client';
import CarsSearchForm from '../components/cars/CarsSearchForm';

let Home = {
    'init': () => {

        if (document.body.getAttribute('id') === 'home')

        ReactDOM.createRoot(document.getElementById('list-tutorials-by-categories'))
            .render(<CarsSearchForm />);
    }
}

export default Home;