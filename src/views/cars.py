from flask import Blueprint, render_template

cars_app = Blueprint('cars_app', __name__, template_folder='../templates')

@cars_app.route('/cars/new/', methods=['GET'], endpoint='create')
def create():
    return render_template('cars/create.html')


@cars_app.route('/cars/{id}', methods=['GET'], endpoint='show')
def detail():
    return render_template('cars/show.html')

#list /cars/
#create /cars/new/
#detail /cars/1/
#update /cars/1/edit/
#delete /cars/1/delete/