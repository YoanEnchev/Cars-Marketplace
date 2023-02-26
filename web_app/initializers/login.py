from models import UserDBModel
from flask_login import LoginManager
from flask import request, jsonify, render_template
from initializers import main_app, db

login_manager = LoginManager()
login_manager.init_app(main_app)

@login_manager.user_loader
def load_user(user_id):
    return db.session.query(UserDBModel).get(user_id)

@login_manager.unauthorized_handler
def unauth_handler():
    if request.is_json:
        return jsonify(success=False,
                       data={'login_required': True},
                       message='Authorize please to access this page.'), 401
    else:
        return render_template('auth/login.html'), 401