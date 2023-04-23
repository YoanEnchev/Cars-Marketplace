import React from 'react'

export default function renderColumnFields(formFields) {
    
    return formFields.map((field, index) => {

        let fieldType = field.type

        let sizeClasses = field.sizeClasses || 'col-6 col-md-3'

        let fieldClasses = 'mt-2 ' + (fieldType === 'dropdown' ? 'form-select' : 'form-control')

        if (field.value && field.defaultValue) {
            throw new Error('You can only set either defaultValue or value property.')
        }

        let propsObj = {
            className: fieldClasses,
            placeholder: field.placeholder,
            name: field.name,
            placeholder: field.placeholder,
            style: {
                minHeight: field.minHeight
            },
            onChange: field.onChange,
            value: field.value,
            defaultValue: field.defaultValue,
            required: field.required,
            min: field.min,
            max: field.max,
            minLength: field.minLength,
            maxLength: field.maxLength,
        }

        if (fieldType === 'input') {
            propsObj.type = field.inputType || 'input'
        }

        return (
            <div className={`field-wrapper ${sizeClasses}`} key={index}>
                <label className='p-1 w-100'>{field.label}
                    {
                        fieldType === 'input' ?
                            <input {...propsObj} /> :
                        fieldType === 'dropdown' ?
                            <select {...propsObj} >
                                {field.options.map((optionData, index) => <option value={optionData.value} key={index}>{optionData.label}</option>)}
                            </select> :
                        fieldType === 'textarea' ? 
                            <textarea rows="5" {...propsObj}></textarea>
                        : ''
                    }
                </label>
            </div>
        )
    })
}