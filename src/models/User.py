from run import db
from werkzeug.security import generate_password_hash
from flask_login import UserMixin

class User(db.Model, UserMixin):

    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), unique=True, nullable=False)
    first_name = db.Column(db.String(80), nullable=False)
    password = db.Column(db.String(100))

    def __init__(self, props: dict):
        self.email = props['email']
        self.first_name = props['first_name']
        self.password = generate_password_hash(props['password'], method = 'sha256')
        