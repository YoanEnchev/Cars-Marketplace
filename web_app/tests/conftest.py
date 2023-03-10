import pytest
from initializers.app import main_app
from initializers.database import db
from models.Role import RoleDBModel

@pytest.fixture(scope="session", autouse=True)
def callattr_ahead_of_alltests():
    """Fixture to execute asserts before and after a test is run"""
    # Setup: fill with any logic you want
    print('START')
    print('Here 1')

    with main_app.app_context():
        print('Here 2')
        db.drop_all() # Drop tables.
        #db.create_all() # Create tables.
#
#
        ## Creates only roles table since only one module is imported.
        #role_admin = RoleDBModel({'title': 'admin xx'})
        #db.session.add(role_admin)
#
        #role_ordinary_user = RoleDBModel({'title': 'ordinary_user xx'})
        #db.session.add(role_ordinary_user)
        #db.session.commit()

    yield # this is where the testing happens

    # Teardown : fill with any logic you want
    print('FINISH')