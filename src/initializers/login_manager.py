from src.models.User import User
from flask_login import LoginManager
from run import main_app
from run import db

login_manager = LoginManager()
login_manager.login_view = 'auth_app.login'
login_manager.init_app(main_app)

@login_manager.user_loader
def load_user(user_id):
    return db.session.query(User).get(user_id)