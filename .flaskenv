FLASK_APP="run.py"
FLASK_DEBUG=1

DB="postgresql"
DB_USER="postgres"
DB_HOST="localhost"
DB_POSTGRES_PORT=5432
DB_NAME="cars_marketplace"
DB_PASSWORD="common"
DB_URL="${DB}://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_POSTGRES_PORT}/${DB_NAME}"