import React from 'react'
import ReactDOM from 'react-dom/client'
import LoginForm from '../components/auth/LoginForm'

let Login = {
    'init': () => {
        return (
            document.body.getAttribute('id') === 'login' ?
                ReactDOM
                    .createRoot(document.getElementById('login-form'))
                    .render(<LoginForm />) : ''
        )
    }
}

export default Login