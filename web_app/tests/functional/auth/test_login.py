from tests.functional.common import BASE_URL
import requests
from app import main_app

def test_get_request():
    
    response = requests.get(f'{BASE_URL}/login')

    assert response.ok
    assert '<div id="login-form"' in response.text

def test_inexisting_email():
    
    response = requests.post(f'{BASE_URL}/login', {
        'email': 'fake@email.com',
        'password' : '123456'
    })

    assert response.ok
    assert 'Потребител с такъв имейл не съществува.' in response.text

def test_invalid_password():

    response = requests.post(f'{BASE_URL}/login', {
        'email': 'lidoandoliver@hulas.me',
        'password' : 'invalid_password'
    })

    assert response.ok
    assert 'Невалидна парола.' in response.text

def test_valid_credentials():
    
    response = requests.post(f'{BASE_URL}/login', {
        'email': 'lidoandoliver@hulas.me',
        'password' : '123456'
    })

    assert response.ok
    assert 'Успешнo влизане.' in response.text