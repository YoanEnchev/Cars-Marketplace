# Cars Marketplace

Simple web application using Python & Flask in the backend, TypeScript & React in the frontend and docker.

---------------------------------------------

## Installation
- Create .env file with the same content as .env.example:
```
cp .env.example .env
```
- If deploying in production edit the .env file to set different passwords (also change the corresponding values in `db/create_test_db.sql`).

- Install docker (or just Docker Desktop if you want) depending on your os.

- Build & start containers (it's going to take a while pulling all images) by running the following command:
```
docker-compose up
```
- Wait until command finishes. You should see the following output when it's completed:
```
..........................................
Finished building. Server is up
..........................................
```

---------------------------------------------

## Preview the app

Visit the following URL: `http://localhost:80`. 

Make sure the port is not taken by some other app. Change port if needed.

---------------------------------------------

## Frontend Development

In order for changes to take effect you need to run the npm watcher:

- Open the python_server container (by default the location is /var/www/web_app)

- Execute the command `cd assets/js`

- Execute the command `npm run watch`

- Edit any js/scss files to preview changes

- Let the command window open so the watcher detects changes during development

---------------------------------------------

## Containers

### python_server
Contains backend (Python) and frontend (React + TypeScript) logic. You can do the actions in CLI such as:
- Run npm watcher (see the frontend development section)
- View or modify the apache error log (`/var/log/apache2/error.log`):
    - To view the file contents:
        - `cat /var/log/apache2/error.log`
    - To view or edit content you can use the installed nano editor or vim:
        - `nano /var/log/apache2/error.log`
    - Truncate content:
        - `truncate -s 0 /var/log/apache2/error.log`

### postgre_db
Container serving as a relational database. You can connect to the app database by doing the following:
- Open the container in CLI
- Execute `psql --host=postgres --username=$POSTGRES_USER --dbname=$POSTGRES_DB`
- Enter the db password corresponding to the DB_PASSWORD variable in the .env file. It's `SAMPLE_PASSWORD` by default
- Afterwards you can execute any PostgreSQL command such as ` select * from users;`

To connect to the test database perform the following commands:
- Open the container in CLI
- Executing `psql --host=postgres --username=$DB_USER_TEST --dbname=$DB_NAME_TEST`
- Enter the test db password corresponding to the DB_PASSWORD_TEST variable in the .env file. It's `test_db_common` by default
- Afterwards you can execute any PostgreSQL command such as `select * from users;`

### redis_db
Container serving as a redis database used for caching. You can connect to the app database by doing the following:
- Open the container in CLI by executing this command: `redis-cli`
- To authorize perform the following command: `AUTH <redis_password>`. Replace `<redis_password>` with the value of the environment variable of `REDIS_PASSWORD` (example: `AUTH SAMPLE_REDIS_PASSWORD`)
- Afterwards you can execute any redis command such as `keys *`

To connect to the test database perform the following commands:
- Open the container in CLI by executing this command: `redis-cli`
- To authorize perform the following command: `AUTH <redis_password>`. Replace `<redis_password>` with the value of the environment variable of `REDIS_PASSWORD_TEST` (example: `AUTH SAMPLE_REDIS_PASSWORD_FOR_TESTS`)