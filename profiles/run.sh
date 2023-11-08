# profile is just string key
# This allows you to define additional services in a single compose.yml file 
# that should only be started in specific scenarios, for example for debugging or development tasks.
docker compose --profile frontend --profile debug up