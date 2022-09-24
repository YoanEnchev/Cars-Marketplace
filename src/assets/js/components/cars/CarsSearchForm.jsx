import React from 'react';

class CarsSearchForm extends React.Component {

    constructor(props) {
        super(props);

        /*this.state = {
        }*/
    }

    render() {
        return (
            <form method='GET' action=''>
                <div class="row">
                    <div class="col-3">
                        <label for="make">Марка</label>
                        <select class="form-select form-select-sm" name="make" id="make">
                            <option selected></option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <label for="model">Модел</label>
                        <select class="form-select form-select-sm" name="model" id="model">
                            <option selected></option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <label for="region">Област</label>
                        <select class="form-select form-select-sm" name="region" id="region">
                            <option selected></option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="col-3">
                        <label for="subregion">Населено място</label>
                        <select class="form-select form-select-sm" name="subregion" id="subregion">
                            <option selected></option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
            </form>
        );
    }
}

export default CarsSearchForm;