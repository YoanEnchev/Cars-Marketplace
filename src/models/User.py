from run import db
from werkzeug.security import generate_password_hash
from flask_login import UserMixin

class User(db.Model, UserMixin):

    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), unique=True, nullable=False)
    first_name = db.Column(db.String(80), nullable=False)
    password = db.Column(db.String(100))

    def __init__(self, email, first_name, password):
        self.email = email
        self.first_name = first_name
        self.password = generate_password_hash(password, method = 'sha256')
        