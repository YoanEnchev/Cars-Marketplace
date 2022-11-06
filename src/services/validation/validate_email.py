from wtforms.validators import ValidationError
from src.models.User import User

def validate_email(self, field):
    if User.query.filter_by(email=field.data).first():
        raise ValidationError('Email is already in use.')