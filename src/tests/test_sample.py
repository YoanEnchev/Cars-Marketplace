import pytest

@pytest.fixture(autouse=True)
def run_before_and_after_tests(tmpdir):
    """Fixture to execute asserts before and after a test is run"""
    # Setup: fill with any logic you want
    print('START')

    yield # this is where the testing happens

    # Teardown : fill with any logic you want
    print('FINISH')

def func(x):
    return x + 2


def test_answer():
    assert func(3) == 5


def test_answer_2():
    assert func(0) == 2