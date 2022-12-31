from functools import wraps
from flask import request, redirect, url_for, flash
from flask_login import current_user

def must_be_admin(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not current_user.is_authenticated or not current_user.is_admin():
            flash('Отказан достъп. Необходими са права на администратор.', 'danger')
            return redirect(url_for('home_app.home'))
        return f(*args, **kwargs)
    return decorated_function