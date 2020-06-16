# optum-workshop

### Dev environment

1. Use `docker-compose up -d`

OR

2. [![Deploy to
Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/tirumaraiselvan/3factor-workshop-heroku)

### Loading initial data

```
docker cp chinook.sql 9dcab504d90f:/
docker exec -ti 9dcab504d90f /bin/bash
psql -U postgres /bin/bash
```

OR if you already have psql installed locally

```
psql  < chinook.sql
```

