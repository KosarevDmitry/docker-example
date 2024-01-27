docker compose version 
Docker compose version v2.4.1

# https://hub.docker.com/_/microsoft-dotnet-aspnet?tab=description
# images
# https://hub.docker.com/u/microsoft
# manual https://docs.docker.com/get-started/02_our_app/
# dockerfile content

# https://blog.diogomonica.com//2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/   post of former security employer of docker

``` 
# syntax=docker/dockerfile:1
       FROM   node:18-alpine
       WORKDIR /app
       # copy dir content
       COPY . .
       # create dependency
       RUN yarn install --production
       # The CMD directive specifies the default command to run when starting a container from this image
       CMD ["node", "src/index.js"] 
       EXPOSE 3000
 ```
 # in ubuntu run by sudo privilege, sort out how to run without sudo privilege?
systemctl start docker  
docker version
docker compose version
docker build -t getting-started .    # -t tag  of "getting-started" aka name, dot in the end of command tells Docker that it should look for the Dockerfile in the current directory.
# hostname/repository:tag  # image naming rule: hostname  will be  my Docker ID aka username on hub.docker.com; repository any name as you like;   tag is version , latest by default; example  Docker.io/ubuntu:18.04:latest
docker images # list
docker image ls # ls, which means a list, is default option  
docker inspect 979c9d091f36  # define by image id
docker ps 

docker run -dp 127.0.0.1:3000:3000 getting-started # binding 127.0.0.1:3000 to port 3000 of contanier # open localhost:3000  after changing of source repeat commands 1 and 2
docker stop b6b5316ac2f3 & docker rm b6b5316ac2f3
docker rm -f <the-container-id> # -f force, the same as stop & rm  
docker stop <the-container-id>
docker rm <the-container-id>
docker tag getting-started er2435341q/getting-started # Docker tag name newname, er2435341q my Docker Id
docker push er2435341q/getting-started:latest #  latest is default 
docker build --platform linux/amd64 -t er2435341q/getting-started . #  created new image with another platform type 
docker run -dp 0.0.0.0:3000:3000 er2435341q/getting-started # command  for https://labs.play-with-docker.com/  dp - detach background
docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null" # /dev/null is a null device file, thst will discard anything written to it, and will return EOF on reading.
docker exec <container-id> cat /data.txt # run command inside container
docker run -it ubuntu ls /  # -it For interactive processes (like a shell), ls e
docker volume create todo-db # create volume with sqllite db
docker run -dp 127.0.0.1:3000:3000 --mount type=volume,src=todo-db,target=/etc/todos getting-started # attach  volume. this  mount type is called "volume mount"  
docker volume inspect todo-db
docker run -it --mount type=bind,src="$(pwd)",target=/src ubuntu bash
docker run -it --mount "type=bind,src=%cd%,target=/src" ubuntu bash #Windows cmd; at first cd  any dir  witch you like (working directorys) then run  the command; powershell or linux script, see at https://docs.docker.com/get-started/06_bind_mounts/
cd /src # inside container
ls # file and folder list
#ctrl+D stop bash session
docker run -dp 127.0.0.1:3000:3000 `
    -w /app --mount "type=bind,src=$pwd,target=/app" `
    node:18-alpine `
    sh -c "yarn install && yarn run dev"
 # -w /app working dir node:18-alpine;  package.json start  "dev": "nodemon -L src/index.js" ; 
# when Nodemon detects a change, it restarts the app inside the container automatically; bind mount type. Maunt to folder  
docker logs e63bd12ac223 #  log 'Using sqlite database at /etc/todos/todo.db' from src/persistence/sqlite.js


docker build -t getting-started .
docker run -dp 127.0.0.1:3001:3000 --mount type=volume,src=todo-db,target=/etc/todos getting-started
docker network create todo-app #
docker network --help
docker network ls
# powershell volume created -v automatically
docker run -d `
    --network todo-app --network-alias mysql `
    -v todo-mysql-data:/var/lib/mysql `
    -e MYSQL_ROOT_PASSWORD=secret `
    -e MYSQL_DATABASE=todos `
    mysql:8.0


docker exec -it 3277905b30bc mysql -u root -p  # enter to mysql shell
SHOW DATABASES;

exit  #mysql shell exit
docker run -it --network todo-app nicolaka/netshoot
dig mysql # choose by network-alias What means A record?

# remove all containers beside mysql and nicolaka/netshoot 
docker run -dp 127.0.0.1:3000:3000 `
  -w /app -v "$(pwd):/app" `
  --network todo-app `
  -e MYSQL_HOST=mysql `
  -e MYSQL_USER=root `
  -e MYSQL_PASSWORD=secret `
  -e MYSQL_DB=todos `
  node:18-alpine `
  sh -c "yarn install && yarn run dev"


docker logs -f 13b7aea88852 # -f follow log output
docker exec -it 3277905b30bc mysql -p todos # password secret
#"mysql> select * from todo_items;

# create compose.yaml
docker compose up -d    # -d detached  -f flag follows the log, so will give you live output as it's generated.
# docker compose logs -f   # log 
# docker compose logs -f getting-started-app-mysql-1 # log the single service 
docker-compose config # show content compose file
docker compose images # used images
docker compose down # stop service except volume
docker compose down --volumes stop including volume too
docker image history getting-started #  Each of the lines  in represents a layer in the image. T
docker image history --no-trunc getting-started # no truncated log 

# if  add .dockerignore  with node_modules for escape dependency recreation, work better docker build -t getting-started .




#------------------------

docker pull
docker restart
docker передать скрипт
docker logs guid
~!# docker ps
docker inspect
docker rm
"C:\Program Files\Docker\Docker\DockerCli.exe" -SwitchDaemon
docker-machine env --shell=powershell | Invoke-Expression
 
From  
Run  # run bush to make folder for example
Env=121  # enviroment variable
Add from url and from local
Copy from local
Cmd  If you include more than one, only the last one will take effect.The main purpose for this instruction is to provide a default for executing a container.
From ubuntu 18:04
Copy . /App
Run make /app
Cmd


Docker run my-app:v2  #create container из image если его нет локально то скачивает из репозитория
Docker push my-app:v1 https://docs.docker.com/engine/reference/commandline/tag/
# P 8080:80 # map port 8080 of  local machine to port 80 of image
docker image rm hello1 # remove container 
docker images
docker ps 
docker ps -a
docker ps -aq # список контейнеров # List all containers (only IDs)
docker stop $(docker ps -aq) # Stop all running container
docker rm $(docker ps -aq) # Remove all containers
docker rmi $(docker images -q) # Remove all images
docker container rm c16ff651ddca #remove container
docker inspect dad65abb65de #information about  image

#latest: Pulling from library/hello-world
#Using default tag: latest
docker pull hello-world

docker run hello-world (or by ID) #run создает каждый раз новый container 


dotnet build "D:\Дмитрий\EDX\Docker\NETCOREREST\NETCOREREST.csproj" /property:GenerateFullPaths=true /consoleloggerparameters:Summary
docker build --rm --pull -f "D:\Дмитрий\EDX\Docker\NETCOREREST/Dockerfile" --label "com.microsoft.created-by=visual-studio-code" -t "netcorerest:v1" "D:\Дмитрий\EDX\Docker\NETCOREREST"
#--rm there to tell the Docker Daemon to clean up the container and remove the file system after the container exits. 
# -f "D:\Дмитрий\EDX\Docker\NETCOREREST/Dockerfile  path to docker file
# --label "com.microsoft.created-by=visual-studio-code" включен в image, смотреть docker inspest
#--pull  latest


docker container create --name abudabi  e6216d5629d4  # create container with  image e6216d5629d4
docker volume ls #Then, there are mounts, which bind directories from the host to the container, usually managed automatically with a Docker feature called volumes. These are stored normally, and are accessible to end users. If you’re doing any work that requires you to modify data on running containers, you should probably be modifying a volume or bind mount.
docker volume create
docker volume inspect

# =Добавьте группу docker, если она еще не существует:

# sudo groupadd docker

# Добавьте подключенного пользователя "${USER}" в группу docker:

sudo gpasswd -a ${USER} docker
sudo service docker restart  # restart Docker

docker run --detach --publish 81:80 --name webserver nginx # download wevserver and call it on port 81; test http://localhost:81/
docker run --publish 81:80 --name webserver nginx # запустить и  опубликовать под именем webserver image nginx который будет доступен извне на порту 81 и будет получать внутри  команды на 80 порту  
docker run --publish 82:80 --name newgetting-started docker/getting-started:latest

# wsl2 не поддерживает daemon похоже не работает
sudo service docker start 
sudo service docker status
sudo kill -SIGHUP $(pidof dockerd) #reload configuration
 /etc/docker/daemon.json #configuration 
