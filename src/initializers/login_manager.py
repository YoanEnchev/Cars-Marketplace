from flask_login import LoginManager
from run import main_app

login_manager = LoginManager()
login_manager.login_view = 'auth.login'
login_manager.init_app(main_app)

@login_manager.user_loader
def load_user(user_id):
    return User.get(user_id)