from injector import singleton
from flask_injector import FlaskInjector
from flask import request

from src.services.UserService import UserService
from src.repositories.UserRepository import UserRepository

def configure(binder):
    binder.bind(UserService, to=UserService, scope=request)
    binder.bind(UserRepository, to=UserRepository, scope=request)