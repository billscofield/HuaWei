## 容器编排工具

1. docker swarm

1. apache mesos

1. google kubernetes

## docker-compose 单机编排

### 安装

apt-cache show docker-compose
apt-get install docker-compose

### 使用

up                 Create and start containers
start              Start services
stop               Stop services
top                Display the running processes
rm                 Remove stopped containers

build              Build or rebuild services
bundle             Generate a Docker bundle from the Compose file
config             Validate and view the Compose file
create             Create services
down               Stop and remove containers, networks, images, and volumes
events             Receive real time events from containers
exec               Execute a command in a running container
help               Get help on a command
images             List images
kill               Kill containers
logs               View output from containers
pause              Pause services
port               Print the public port for a port binding
ps                 List containers
pull               Pull service images
push               Push service images
restart            Restart services
run                Run a one-off command
scale              Set number of containers for a service
unpause            Unpause services
version            Show the Docker-Compose version information


-f, --file FILE
    Specify an alternate compose file (default: docker-compose.yml)


