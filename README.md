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

## Preview the app

Visit the following URL: `http://localhost:80`. 

Make sure the port is not taken by some other app. Change port if needed.


##  Development

