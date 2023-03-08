from initializers.app import main_app
from initializers.database import db
from flask.cli import with_appcontext

@main_app.cli.command('drop-tables')
@with_appcontext
def drop_tables():
    # drops all tables.
    db.drop_all()