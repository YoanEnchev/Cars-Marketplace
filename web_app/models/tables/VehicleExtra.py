from helpers.database import db

VehicleExtraDBTable = db.Table('vehicle_extra',
    db.Column('vehicle_ad_id', db.Integer, db.ForeignKey('vehicle_ads.id', ondelete="CASCADE")),
    db.Column('extra_id', db.Integer, db.ForeignKey('extras.id', ondelete="CASCADE"))
)