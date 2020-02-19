# nginx-mate

## Push Image to Docker Hub

```
docker login

docker image ls | grep mate

docker tag nginx-mate_nginx-mate:latest laimison/nginx-mate:v1

docker push laimison/nginx-mate:v1
```

or create here

https://hub.docker.com/repository/create

```
docker push laimison/nginx-mate:v1
```
