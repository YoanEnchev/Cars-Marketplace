from wtforms import Form, StringField, PasswordField
from wtforms.validators import DataRequired, EqualTo, Length, ValidationError
from src.repositories.UserRepository import UserRepository


def validate_email(self, field):
    if (UserRepository()).find_by_email(field.data):
        raise ValidationError('Email is already in use.')

class RegistrationForm(Form):
    email = StringField('Email', [DataRequired(), Length(min=6, max=100), validate_email])
    name = StringField('Name', [DataRequired(), Length(min=2, max=100)])
    password = PasswordField('Password', [
        DataRequired(),
        EqualTo('repeat_password', message='Passwords must match.'),
        Length(min=6, max=100)
    ])
    repeat_password = PasswordField('Repeat Password')