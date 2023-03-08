import React, { FC, useState, ChangeEvent } from 'react'
import validateEmail from '../../helpers/validateEmail'
import RegisterFormProps from '../../common/interfaces/properties/RegisterFormProps'
import RegisterFormValidation from '../../common/interfaces/validations/RegisterFormValidation'
const RegisterForm: FC<RegisterFormProps> = (props) => {

    const [email, setEmail] = useState<string>(props.email || '')
    const [firstName, setFirstName] = useState<string>(props.firstName || '')
    const [phone, setPhone] = useState<string>(props.phone ?? '')
    const [password, setPassword] = useState<string>('')
    const [repeatPassword, setRepeatPassword] = useState<string>('')
    
    function onInputTyping(event: ChangeEvent<HTMLInputElement>): void {
      let elem: HTMLInputElement = event.target
      let value: string = elem.value
      
      switch(elem.name) {
          case 'email':
              setEmail(value)
              break
          case 'first_name':
              setFirstName(value)
              break
          case 'phone':
              setPhone(value)
              break
          case 'password':
              setPassword(value)
              break
          case 'repeat_password':
              setRepeatPassword(value)
              break
      }
    }

    let conditions: RegisterFormValidation = {
        email: validateEmail(email),
        firstName: firstName.length >= 2,
        phone: (phone.length >= 10 && phone.length <= 20),
        password: password.length >= 6,
        repeatPassword: password === repeatPassword && repeatPassword.length > 0
    }

    let filledEmail: boolean = email !== ''
    let filledFirstName: boolean = firstName !== ''
    let filledPhone : boolean= phone !== ''
    let filledPassword: boolean = password !== ''
    let filledRepeatPassword: boolean = repeatPassword !== ''

    let allFieldsAreValid : boolean = Object.entries(conditions)
      .map(([key, condition]: [String, Boolean]) => condition)
      .every(c => c)

    return (
        <form method='POST' action='/register'>
          <div className="form-group mb-3">
            <label htmlFor="email" className='mb-2'>Имейл</label>
            <input type="email" className={'form-control ' + (filledEmail ? (conditions.email ? 'is-valid' : 'is-invalid') : '')} id="email" name="email" onChange={onInputTyping} value={email} />
            {(filledEmail && !conditions.email) ? <small className="form-text text-danger">Невалиден имейл.</small> : ''}
          </div>
          <div className="form-group mb-3">
            <label htmlFor="first_name" className='mb-2'>Име</label>
            <input className={'form-control ' + (filledFirstName ? (conditions.firstName ? 'is-valid' : 'is-invalid') : '')} id="first_name" name="first_name" onChange={onInputTyping} value={firstName} />
            {(filledFirstName && !conditions.firstName) ? <small className="form-text text-danger">Името трябва да съдържа поне 2 символа.</small> : ''}
          </div>
          <div className="form-group mb-3">
            <label htmlFor="phone" className='mb-2'>Телефон за обяви</label>
            <input className={'form-control ' + (filledPhone ? (conditions.phone ? 'is-valid' : 'is-invalid') : '')} id="phone" name="phone" onChange={onInputTyping} value={phone} type='tel' />
            {(filledPhone && !conditions.phone) ? <small className="form-text text-danger">Телефонния номер трябва да е с дължина между 10 и 20 символа.</small> : ''}
          </div>
          <div className="form-group mb-3">
            <label htmlFor="password" className='mb-2'>Парола</label>
            <input type="password" className={'form-control ' + (filledPassword ? (conditions.password ? 'is-valid' : 'is-invalid') : '')} id="password" name="password" onChange={onInputTyping} value={password} />
            {(filledPassword && !conditions.password) ? <small className="form-text text-danger">Паролата трябва да се състои от поне 6 символа.</small> : ''}
          </div>
          <div className="form-group mb-3">
            <label htmlFor="repeat-password" className='mb-2'>Повтори Парола</label>
            <input type="password" className={'form-control ' + (filledRepeatPassword ? (conditions.repeatPassword ? 'is-valid' : 'is-invalid') : '')} id="repeat-password" name="repeat_password" onChange={onInputTyping} value={repeatPassword} />
            {(filledRepeatPassword && !conditions.repeatPassword) ? <small className="form-text text-danger">Повторената парола не съвпада с паролата.</small> : ''}
          </div>

          <button type="submit" className="btn btn-primary" disabled={!allFieldsAreValid}>Регистрирай</button>
        </form>
    )
}

export default RegisterForm;