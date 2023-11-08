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

docker run -it --name mycontainer2 alpine  # compose.yaml is not required, it downloaded from remote repo automatically 
 version     Show the Docker Compose version information
 
 # run 2 containers
docker create -v /data --name data ubuntu
docker run --rm --volumes-from data ubuntu ls -la /data  # execute the command and is deleted immediately

 images      List images used by the created containers # ? containers actually dispalyed 
 ps          List containers 
 ls          List running compose projects # stopped services, with status "exited" are  not displayed, only runnig 
  
 build       Build or rebuild images of services
 create      Creates containers for a service.
 docker compose up          Create and start containers
# after "up" commands works: stop rm pause unpause and so on.
#if run just define service it needs to call docker (not compose) stop | rm  ets.  
 docker compose stop backend       Stop services 
 docker compose rm backend 
  
 run         build image, create container and run.
 down        Stop and remove containers, networks
 kill        Force stop service containers.  
 rm          Removes stopped service containers
 restart     Restart service containers
 
 unpause     Unpause services
 pause       Pause services
   
 start       Start services
 
 pull        Pull service images
 push        Push service images
 
 events      Receive real time events from containers.
 exec        Execute a command in a running container.
 
 port        Print the public port for a port binding.

 cp          Copy files/folders between a service container and the local filesystem
 scale       Scale services
 logs        View output from containers
 top         Display the running processes
 wait        Block until the first service container stops
  
  watch       Watch build context for service and rebuild/refresh containers when files are updated