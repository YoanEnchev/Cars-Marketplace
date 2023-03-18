from initializers.database import db
from werkzeug.security import generate_password_hash
from flask_login import UserMixin
from models.Role import RoleDBModel

class UserDBModel(db.Model, UserMixin):

    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    role = db.relationship(RoleDBModel, lazy="joined") # Eager load.
    
    email = db.Column(db.String(120), unique=True, nullable=False)
    first_name = db.Column(db.String(80), nullable=False)
    phone = db.Column(db.String(30), nullable=False)
    password = db.Column(db.String(100), nullable=False)

    def __init__(self, props: dict):
        self.email = props['email']
        self.first_name = props['first_name']
        self.phone = props['phone']
        self.password = generate_password_hash(props['password'], method = 'sha256')
        self.role_id = RoleDBModel.ORDINARY_USER_ID

    def is_admin(self):
        return self.role.is_admin_role()

    def serialize(self, relations=[]):
        
        return {
            'id': self.id,
            'email': self.email,
            'first_name': self.first_name
        }