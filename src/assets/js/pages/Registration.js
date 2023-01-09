import React from 'react'
import ReactDOM from 'react-dom/client'
import RegisterForm from '../components/auth/RegisterForm'

let Registration = {
    'init': () => {
        document.body.getAttribute('id') === 'registration' ?
            ReactDOM
                .createRoot(document.getElementById('register-form'))
                .render(<RegisterForm {...fromPython.registrationData} />) : ''
    }
}

export default Registration


