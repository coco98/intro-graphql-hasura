# Intro GraphQL & Hasura

### Dev environment

1. Use `docker-compose up -d`

OR

2. [![Deploy to
Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/hasura/graphql-engine-heroku)

### Loading initial data

```
docker cp chinook.sql 9dcab504d90f:/
docker exec -ti 9dcab504d90f /bin/bash
psql -U postgres /bin/bash
```

OR if you already have psql installed locally

```
psql postgres://postgres:mypassword@localhost:6432/postgres < chinook.sql
```

### Remote schema endpoint

https://op-workshop-remote-schema-6923.herokuapp.com/v1/graphql

