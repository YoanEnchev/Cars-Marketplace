from tests.functional.common import BASE_URL
import requests

def test_get_request():
    
    response = requests.get(f'{BASE_URL}/login')

    assert response.status_code == 200
    assert '<div id="login-form"' in response.content.decode("utf-8")

def test_post_request():
    # Unsuccessful login - wrong credentials:
    response = requests.post(f'{BASE_URL}/login', {
        'email': 'fake@email.com',
        'password' : 'invalid_password'
    })

    


    # Successful login: