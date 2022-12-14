import pytest
from run import main_app, db
from src.models.Role import Role

@pytest.fixture(autouse=True)
def run_before_and_after_tests(tmpdir):
    """Fixture to execute asserts before and after a test is run"""
    # Setup: fill with any logic you want
    print('START')

    with main_app.app_context():
        db.drop_all() # Drop tables.
        db.create_all() # Create tables.

        role_admin = Role({'title': 'admin xx'})
        db.session.add(role_admin)

        role_ordinary_user = Role({'title': 'ordinary_user xx'})
        db.session.add(role_ordinary_user)
        db.session.commit()

    yield # this is where the testing happens

    # Teardown : fill with any logic you want
    print('FINISH')