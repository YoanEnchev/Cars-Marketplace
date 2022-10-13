// JS
import bootstrap from 'bootstrap'

import Home from './pages/Home'
import Registration from './pages/Registration'
import Login from './pages/Login'
import CarAdCreation from './pages/CarAdCreation'

// SCSS/CSS (it's added to <style>)
import 'bootstrap/dist/css/bootstrap.min.css'
import '../scss/general.scss'


// Initialize JS pages
Home.init()
Registration.init()
Login.init()
CarAdCreation.init()