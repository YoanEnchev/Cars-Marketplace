from flask import Blueprint

cars_app = Blueprint('cars_app', __name__)

@cars_app.route('/')
def home():
    return '<html><body><h1>Hello, World!<button class="btn btn-primary">xxx</button></h1><img src="http://localhost:5000/static/imgs/pic.webp"></body><script src="/static/js/app.bundle.js"></script></html>'
