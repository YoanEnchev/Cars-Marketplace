from models.User import UserDBModel
from flask_login import LoginManager
from flask import request, jsonify, render_template
from app import main_app
from helpers.database import db

login_manager = LoginManager()
login_manager.init_app(main_app)

@login_manager.user_loader
def load_user(id):
    try:
        return db.session.query(UserDBModel).filter_by(id=id).first()
    except:
        return None

@login_manager.unauthorized_handler
def unauth_handler():
    if request.is_json:
        return jsonify(success=False,
                       data={'login_required': True},
                       message='Необходимо е да влезете в системата за да достъпите страницата.'), 401
    else:
        return render_template('auth/login.html'), 401