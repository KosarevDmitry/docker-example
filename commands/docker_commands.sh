# https://docs.docker.com/engine/reference/commandline/docker/
docker version     Show the Docker Compose version information
docker system info 
docker system df
docker search busybox # search in hub

docker run -it --name mycontainer2 alpine  # compose.yaml is not required, it downloaded from remote repo automatically 

# run 2 containers
docker create -v /data --name data ubuntu
docker run --rm --volumes-from data ubuntu ls -la /data  #  to execute the command and then to delete immediately
 
docker images      List images used by the created containers # ? containers actually dispalyed 
docker ps          List containers 
 
docker build     #  Build or rebuild images of services
docker create    #  Creates containers for a service. ( not run)
docker up        #  Create and start containers
docker down      #  Stop and remove containers, networks
# after "up"  following commands work: stop rm pause unpause and so on.
  
docker run       #  Run a one-off command on a service
 
docker kill        # Force stop service containers.  
docker rm         # Removes stopped service containers
docker restart    # Restart service containers
 
docker unpause    # Unpause services
docker pause      # Pause services
   
docker start     # Start services
 
docker pull      # Pull service images
docker push      #  Push service images
 
docker events     # Receive real time events from containers.
 
docker exec      # Execute a command in a running container.

#docker exec -it MyContainer1 mkdir "/var/opt/mssql/backup" 
docker port    #  Print the public port for a port binding.

docker cp      # Copy files/folders between a service container and the local filesystem
   #Example
#https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-configure?view=sql-server-ver16&pivots=cs1-bash
docker cp <Container ID>:<Container path> <host path>
docker cp d6b75213ef80:/var/opt/mssql/log/errorlog /tmp/errorlog
docker cp d6b75213ef80:/var/opt/mssql/log/errorlog C:/tmp/errorlog
docker cp /tmp/mydb.mdf d6b75213ef80:/var/opt/mssql/data
 
docker scale  # Scale services
 
docker logs   # View output from containers
  
docker compose logs -f -t
 
docker top    # Display the running processes
docker top 62638938
docker wait   # Block until the first service container stops
  
docker watch  # Watch build context for service and rebuild/refresh containers when files are updated
 
docker volume  ls # volume listing
