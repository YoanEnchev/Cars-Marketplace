import pytest
from initializers.app import main_app
from initializers.database import db
from commands.seeder import seed_fictive_records

@pytest.fixture(scope="session", autouse=True)
def call_ahead_of_all_tests():

    with main_app.app_context():
        db.drop_all()
        db.create_all()
        seed_fictive_records()
        yield # this is where the testing happens

    # Teardown : fill with any logic you want
    