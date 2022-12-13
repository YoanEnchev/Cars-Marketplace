from flask import render_template
from run import main_app

@main_app.errorhandler(404)
def page_not_found(e):
    return render_template('status_codes/404.html'), 404