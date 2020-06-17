# Intro GraphQL & Hasura

This workshop provides a hands-on introduction to the fundamental concepts of GraphQL and the Hasura GraphQL Engine.

## Setup

#### Requirements: Docker installed and available

![Local setup in terminal](images/Hasura_setup_bash.png)

Check installation via the command line: `docker --version` should return something like `Docker version 19.03.8, build af0cb9b`

Check availability via the command line: `docker ps` should return something like 'CONTAINER ID IMAGE COMMAND CREATED ...'. If you see messages like 'Error response from daemon' or 'Cannot connect to the Docker daemon', try restarting your docker service.

Installation instructions can be found here: https://docs.docker.com/get-docker/

#### Recommended: PostgreSQL / psql installed and available

Check installation via the command line: `psql --version` should return something like `psql (PostgreSQL) 12.2`

Installation instructions can be found here: https://www.postgresql.org/download/

## Getting started

You will work with local Docker containers for this tutorial; see the services "postgres" and "graphql-engine" in `docker-compose.yaml`

To begin, use `docker-compose up -d`

View your new Hasura GraphQL Engine Console at [http://localhost:8080](http://localhost:8080) (admin secret from docker-compose.yaml: `adminsecret`)

_Note_ To end a session, use `docker-compose down`

In case there is difficulty with Docker locally, use a free Heroku deployment instead:

[![Deploy to
Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/coco98/intro-graphql-hasura)

## Loading initial data

#### For local Docker setup

Use the following command to set up initial tables and data into your postgres container:

```
psql postgres://postgres:mypassword@localhost:6432/postgres < chinook.sql

```

If you do not have `psql` available, you can copy the chinook.sql file to the postgres container and execute the `psql` command via inside it:

```
docker cp chinook.sql <postgres-container-ID>:/
docker exec -ti <postgres-container-ID> /bin/bash
psql -U postgres < chinook.sql

```

_Note_ You can find `<postgres-container-ID>` with `docker ps`

#### For a Heroku deployment

From the Heroku app dashboard (`dashboard.heroku.com/apps/<my-app-name>`), navigate to the Settings tab -> Reveal config vars -> DATABASE_URL. Use the following command:

```
psql <DATABASE_URL> < chinook.sql

```

or, lacking psql, use the following (might need to run `heroku login` first):

```
heroku pg:psql -a <my-app-name> < chinook.sql

```

## Track tables and foreign-key relations

![Track tables in console](images/Hasura_setup_track_tables.png)

Return to the Hasura GraphQL Engine console and select the Data tab. In the central view, there should be a section "Untracked tables or views" with several tables listed and a "Track All" option available. Select "Track All", and then "Track All" again for untracked foreign-key relations.

Now you're all set! You should see your tables listed in the left-hand panel.

Go to the Graphiql tab and start trying out queries, mutations, and subscriptions.

#### Remote schema endpoint

An additional Hasura GraphQL Engine instance has already been set up as a Heroku app for practice with remote schemas:

https://op-workshop-remote-schema-6923.herokuapp.com/v1/graphql

_x-hasura-admin-secret: super-secret-password_

It contains the following tables:

- playlist
- playlist_aggregate
- playlist_by_pk
- playlist_track
- playlist_track_aggregate
- playlist_track_by_pk
