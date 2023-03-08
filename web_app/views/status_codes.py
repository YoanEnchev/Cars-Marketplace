from flask import render_template
from initializers.app import main_app

@main_app.errorhandler(403)
def unauthorized(e):
    return render_template('status_codes/403.html'), 403
    

@main_app.errorhandler(404)
def page_not_found(e):
    return render_template('status_codes/404.html'), 404