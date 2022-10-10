import React, { useState } from 'react'
import validateEmail from '../../helpers/validateEmail'

export default function RegisterForm() {

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [repeatPassword, setRepeatPassword] = useState('')
    
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
            case 'repeat_password':
                setRepeatPassword(value)
                break
        }
    }

    let conditions = {
        email: validateEmail(email),
        password: password.length >= 6,
        repeatPassword: password === repeatPassword && repeatPassword.length > 0
    }

    let filledEmail = email !== ''
    let filledPassword = password !== ''
    let filledRepeatPassword = repeatPassword !== ''

    let allFieldsAreValid = Object.entries(conditions)
      .map(([key, condition]) => condition)
      .every(c => c)

    return (
        <form>
          <div className="form-group mb-3">
            <label htmlFor="email" className='mb-2'>Email</label>
            <input type="email" className={'form-control ' + (filledEmail ? (conditions.email ? 'is-valid' : 'is-invalid') : '')} id="email" name="email" onChange={onInputTyping} value={email} />
            {(filledEmail && !conditions.email) ? <small className="form-text text-danger">Email must be valid.</small> : ''}
          </div>
          <div className="form-group mb-3">
            <label htmlFor="password" className='mb-2'>Парола</label>
            <input type="password" className={'form-control ' + (filledPassword ? (conditions.password ? 'is-valid' : 'is-invalid') : '')} id="password" name="password" onChange={onInputTyping} value={password} />
            {(filledPassword && !conditions.password) ? <small className="form-text text-danger">Password must be at least 6 symbols long.</small> : ''}
          </div>
          <div className="form-group mb-3">
            <label htmlFor="repeat-password" className='mb-2'>Повтори Парола</label>
            <input type="password" className={'form-control ' + (filledRepeatPassword ? (conditions.repeatPassword ? 'is-valid' : 'is-invalid') : '')} id="repeat-password" name="repeat_password" onChange={onInputTyping} value={repeatPassword} />
            {(filledRepeatPassword && !conditions.repeatPassword) ? <small className="form-text text-danger">Repeat password must match password.</small> : ''}
          </div>

          <button type="submit" className="btn btn-primary" disabled={!allFieldsAreValid}>Регистрирай</button>
        </form>
    )
}