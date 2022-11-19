from run import main_app, db
from flask.cli import with_appcontext

@main_app.cli.command('drop-tables')
@with_appcontext
def drop_tables():
    # Create tables of each models
    db.drop_all()