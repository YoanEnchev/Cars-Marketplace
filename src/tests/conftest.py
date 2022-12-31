import pytest

@pytest.fixture(autouse=True)
def run_before_and_after_tests(tmpdir):
    """Fixture to execute asserts before and after a test is run"""
    # Setup: fill with any logic you want
    print('START')

    yield # this is where the testing happens

    # Teardown : fill with any logic you want
    print('FINISH')