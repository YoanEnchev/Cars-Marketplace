from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<h1>Hello, World!aaaaa<h1><img src="http://localhost:5000/static/pic.webp">'


@app.route('/about/<username>')
def about_page(username):
    return f'<h1>Hello, {username}<h1>'