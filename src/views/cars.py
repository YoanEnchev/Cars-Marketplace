from flask import Blueprint, render_template

cars_app = Blueprint('cars_app', __name__, template_folder='../templates')

@cars_app.route('/cars/new/', methods=['GET'], endpoint='create')
def create():
    return render_template('cars/create.html')

@cars_app.route('/cars', methods=['GET'], endpoint='list')
def list():
    return render_template('cars/list.html')


@cars_app.route('/cars/<id>', methods=['GET'], endpoint='detail')
def detail(id):
    return render_template('cars/detail.html')