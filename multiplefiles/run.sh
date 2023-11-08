docker compose -f compose.yaml -f compose.admin.yml  config
docker compose -f compose.yaml -f compose.admin.yml  up
docker compose --env-file ./a.env config  # overriding happens
docker compose  config  # use and compose.yaml and  docker-compose.override.yml
# overriding TAG from a.env, despite   # env_file in compose.yaml is defined, doesn't happen

