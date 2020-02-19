# nginx-mate

This is an image to quickly pass the traffic through this Docker container to reach another service

Here are environment variables that should be used in Kubernetes, Docker Compose, etc.

https://hub.docker.com/repository/docker/laimison/nginx-mate

```
server_name=test.example.com
proxy_pass=http://apache:80/
```

If you have more settings, you can optionally use options variable:

```
options="proxy_set_header Host $host; line2; line3;"
```

## Pull Image

Image can be pulled and used

```
docker pull laimison/nginx-mate:latest
```

## Build Image

Login

```
docker login
```

Find your local image

```
docker image ls | grep mate
```

Create repository through

https://hub.docker.com/repository/create

Tag and push it

```
docker tag nginx-mate_nginx-mate:latest laimison/nginx-mate:v1

docker push laimison/nginx-mate:v1
```
