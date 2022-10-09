import React, { useState } from 'react'
import validateEmail from '../../helpers/validateEmail'

export default function RegisterForm() {

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [repeatPassword, setRepeatPassword] = useState('')
    
    function onInputTyping(event) {
        let elem = event.target
        let value = elem.value;
        
        switch(elem.name) {
            case 'email':
                setEmail(value)
                break;
            case 'password':
                setPassword(value)
                break;
            case 'repeat-password':
                setRepeatPassword(value)
                break;
        }
    }

    let conditions = {
        email: validateEmail(email),
        password: password.length >= 6,
        repeatPassword: password === repeatPassword && repeatPassword.length > 0
    }

    console.log(Object.entries(conditions).map(([key, result]) => result));

    return (
        <form>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" onChange={onInputTyping} value={email} />
            {(email !== '' && !conditions.email) ? <small class="form-text text-danger">Email must be valid.</small> : ''}
          </div>
          <div class="form-group">
            <label for="password">Парола</label>
            <input type="password" class="form-control" id="password" onChange={onInputTyping} value={password} />
            {(password !== '' && !conditions.password) ? <small class="form-text text-danger">Password must be 6 .</small> : ''}
          </div>
          <div class="form-group">
            <label for="repeat-password">Повтори Парола</label>
            <input type="password" class="form-control" id="repeat-password" onChange={onInputTyping} value={repeatPassword} />
            {(repeatPassword !== '' && conditions.repeatPassword) ? <small class="form-text text-danger">Password must be 6 .</small> : ''}
          </div>

          <button type="submit" class="btn btn-primary">Регистрирай</button>
        </form>
    )
}