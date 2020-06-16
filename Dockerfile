FROM hasura/graphql-engine:v1.3.0-beta.1

# Enable the console
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true

# Enable debugging mode. It should be disabled in production.
ENV HASURA_GRAPHQL_DEV_MODE=true

CMD graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT