from flask.cli import with_appcontext
from werkzeug.security import generate_password_hash

from src.models.User import User
from faker import Faker
from run import db, main_app

@main_app.cli.command('seed')
@with_appcontext
def seed():

    fake = Faker()
    
    for i in range(1, 4):
        user = User(email=fake.email(), name=fake.name(), password=generate_password_hash('123456', method='sha256'))
        db.session.add(user)


    db.session.commit()