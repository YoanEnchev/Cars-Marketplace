from wtforms import Form, StringField, PasswordField
from wtforms.validators import DataRequired, EqualTo, Length, ValidationError
from repositories.UserRepository import UserRepository


def validate_email(self, field):
    if (UserRepository()).find_by_email(field.data):
        raise ValidationError('Имейлът се използва от друг потребител.')

class RegistrationForm(Form):
    email = StringField('Email', [DataRequired(), Length(min=6, max=100), validate_email])
    first_name = StringField('First Name', [DataRequired(), Length(min=2, max=100)])
    phone = StringField('Phone', [DataRequired(), Length(min=10, max=20)])
    password = PasswordField('Password', [
        DataRequired(),
        EqualTo('repeat_password', message='Паролите не съвпадат.'),
        Length(min=6, max=100)
    ])
    repeat_password = PasswordField('Repeat Password')


    