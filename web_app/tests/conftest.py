import pytest
from initializers.app import main_app
from initializers.database import db
from models.Role import RoleDBModel
from commands.seeder import seed

@pytest.fixture(scope="session", autouse=True)
def callattr_ahead_of_alltests():

    with main_app.app_context():
        db.drop_all()
        print('Here 2')
        seed()

    yield # this is where the testing happens

    # Teardown : fill with any logic you want
    print('FINISH')