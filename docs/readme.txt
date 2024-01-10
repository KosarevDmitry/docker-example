
Better to start with `docker compose config`
or
`docker compose --dry-run up --build -d`
terminal  C:\Program Files\Git\bin\bash.exe
or C:\Program Files\Git\user\bin\bash.exe


You can check the status in both desktop and rider
rider is more compact, but if you look closely all the indicators displayed in desktop
are also reflected in rider.


https://docs.docker.com/compose/compose-file/05-services/#cgroup
https://docs.docker.com/language/dotnet/containerize/
It exists
3 type of CLI
2 type of setting file: dockerfile and docker-compose.yaml


`docker init` - is CLI command like  "dotnet new" or "git init"  
  
if you make changes to the container. stop, start will not affect the changes  


Do not confuse RUN with CMD. RUN actually runs a command and commits the result; 
CMD does not execute anything at build time, but specifies the intended command for the image.
run and cmd are not interchangeable
ENV is visible in container
ARG vs ENV - ARG is not persisted in the final image

Expose
EXPOSE 80/tcp
EXPOSE 80/udp

The docker network command supports creating networks for communication among containers without the need to expose or publish specific ports, because the containers connected to the network can communicate with each other over any port. For detailed information, see the overview of this feature.


# volume list
docker volume ls

docker run --cidfile ~/apps/src/imagesdocker_test.cid ubuntu echo "test"
# create new container
sudo docker create realworld-docker_api:latest --name "test456" 
# copy
sudo docker cp da2d4b7429146fa209fea8a127:usr/src/app/temp/ ~/apps/src/images 
# sudo docker rm a01fdbd9a47cc08d78caf120 

# inspect image
 docker inspect  realworld-docker_api:latest
# inspect container 
 docker inspect da2d4b7429146f209fea8a127 

# copy cid to   ~/apps/src/images/  (UBUNTU path)  
sudo docker run --cidfile ~/apps/src/images/docker_test.cid ubuntu echo "test"

#show only label
docker image inspect --format='{{json .Config.Labels}}' realworld-docker_labeldemo:latest 
# working on running a container
docker exec -it 706d762935556365aa0f5006213fa486e1ae7923e72f104334fd5a7a4bc9a0e7 ps aux 

# rider docker terminal
docker exec -it strange_lamport bash


rider IDE command 'run dockerfile'   and 
'rider build'   and then  'create container'
is not the same 
ENV  is not created. Why?

image used in reference about dockerfile
alpine
busybox
ubuntu
debian

docker
Это заметки о docker oпределения сравнений которые мне представляются интересными важными
definitions
image - file, executable package. Image contains application code, libraries, tools, dependencies and other files needed to make an application run
as example -   the MSI file is a Windows package that contains installation information for a particular installer, including files to be installed 
dockerfile  is `ini file`  with bash syntax

layer  image part, have hash code, 
each command in dockefile represent a layer.  layers is show up in rider and desktop 
'from ubuntu18'  is layer

to use console is  better.
check result sometimes in  IDE Rider,  VS code,  VS
it can be useful for understanding

docker inspect

docker Jet Brain Rider
IDE path: View->Tool Windows->Services

'docker-compose build' or
'docker compose build'
is not matter

minimal config 
```docker-compose.jml in project root dir 
version: '3'
services: 
  api:
    build: ./api  
 ```
   
 ``` dockerfile in api folder
FROM node:13
```    


Open source registry service as like Docker Hub
https://distribution.github.io/distribution/    
