from run import db

class Role(db.Model):

    __tablename__ = 'roles'

    ADMIN_ID = 1
    ORDINARY_USER_ID = 2

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)

    def __init__(self, data):
        self.title = data['title']

    def serialize(self, relations=[]):
        return {}

    def is_admin_role(self):
        return self.id == self.ADMIN_ID