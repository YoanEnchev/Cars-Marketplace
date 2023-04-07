import redis, os, sys

redis_password_key = 'REDIS_PASSWORD'
redis_db_index_key = 'REDIS_INDEX'

if 'pytest' in sys.modules:
    redis_password_key += '_TEST'
    redis_db_index_key += '_TEST'

env_data = os.environ
redis_manager = redis.Redis(host=env_data['REDIS_HOST'], port=env_data['REDIS_PORT'], db=env_data[redis_db_index_key], password=env_data[redis_password_key])