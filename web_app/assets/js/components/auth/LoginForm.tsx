import React, { FC, useState, ChangeEvent } from 'react'

const LoginForm: FC = () => {

    const [email, setEmail] = useState<string>('')
    const [password, setPassword] = useState<string>('')
    
    function onInputTyping(event: ChangeEvent<HTMLInputElement>): void {
        let elem: HTMLInputElement = event.target
        let value: string = elem.value
        
        switch(elem.name) {
            case 'email':
                setEmail(value)
                break
            case 'password':
                setPassword(value)
                break
        }
    }

    return <form method='POST' action='/login'>
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
}

export default LoginForm