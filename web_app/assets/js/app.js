// SCSS/CSS (it's added as <style>)
import 'bootstrap/dist/css/bootstrap.min.css'
import '../scss/general.scss'

// JS
import bootstrap from 'bootstrap'

import Home from './pages/Home'
import Registration from './pages/Registration'
import Login from './pages/Login'
import CarAdCreation from './pages/CarAdCreation'
import CarDetails from './pages/CarDetails'
import CarListing from './pages/CarListing'
import CarAdEdit from './pages/CarAdEdit'
import MyAdsListing from './pages/MyAdsListing'
import PendingApprovalAdsListing from './pages/PendingApprovalAdsListing'

// Initialize JS pages
Home.init()
Registration.init()
Login.init()
CarAdCreation.init()
CarDetails.init()
CarListing.init()
CarAdEdit.init()
MyAdsListing.init()
PendingApprovalAdsListing.init()