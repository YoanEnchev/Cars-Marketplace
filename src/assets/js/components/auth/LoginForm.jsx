import React, { useState } from 'react'

export default function LoginForm() {

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    
    function onInputTyping(event) {
        let elem = event.target
        let value = elem.value
        
        switch(elem.name) {
            case 'email':
                setEmail(value)
                break
            case 'password':
                setPassword(value)
                break
        }
    }

    return (
        <form method='POST' action='/login'>
            <div className="form-group mb-3">
              <label htmlFor="email" className='mb-2'>Имейл</label>
              <input type="email" className="form-control" id="email" name="email" onChange={onInputTyping} />
            </div>
            <div className="form-group mb-3">
              <label htmlFor="password" className='mb-2'>Парола</label>
              <input type="password" className="form-control" id="password" name="password" onChange={onInputTyping} />
            </div>

            <button type="submit" className="btn btn-primary" disabled={email == '' || password == ''}>Вход</button>
        </form>
    )
}