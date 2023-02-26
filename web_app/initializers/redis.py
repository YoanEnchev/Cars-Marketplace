import redis
import os

env_data = os.environ
redis_manager = redis.Redis(host = env_data['REDIS_HOST'], port = env_data['REDIS_PORT'], db = 0, password = env_data['REDIS_PASSWORD'])