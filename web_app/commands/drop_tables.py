from initializers.db import db
from initializers.main_app import main_app
from flask.cli import with_appcontext

@main_app.cli.command('drop-tables')
@with_appcontext
def drop_tables():
    # drops all tables.
    db.drop_all()