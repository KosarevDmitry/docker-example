docker compose  config --output "./config.yaml" 	# to file
docker compose  config -o "./config.json" --format "json" # to file
docker compose  config --services # list
docker compose  config --volumes # list
docker compose  config --images # list
docker compose  config --hash  backend # service hash
docker compose  config  --resolve-image-digests # print   docker.io/library/busybox:latest@sha256:3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79

docker compose --dry-run up --build -d  # command simulator  
 
docker compose  -p myname build  # ? add label "com.docker.compose.project" : "myname"

docker compose  run -e DEBUG=3  frontend # run with additonal env
docker compose run frontend # open bash session
docker compose run  --build frontend 
docker compose run  --workdir 'usr/src/app' frontend # doesn't work
docker compose run  --label 'apps=1' frontend # create container commands-frontend-run-2e9d7301f11e
# use docker for manipulation
docker stop commands-frontend-run-2e9d7301f11e
docker rm commands-frontend-run-2e9d7301f11e

docker compose top  frontend # for runnig container

docker compose ls          List running compose projects # stopped services, with status "exited" are  not displayed, only runnig 

#if run just define service it needs to call docker (not compose) stop | rm  ets.  
docker compose stop backend      # Stop services 
docker compose rm backend  
 