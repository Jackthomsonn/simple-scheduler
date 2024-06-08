# simple-scheduler

This is a Docker image that allows you to create a simple scheduler to call an API

```
scheduler:
    image: jackthomson/simple-scheduler
    environment:
      - CONTAINER_NAME=http://weather:8080/weather
      - FREQUENCY_SECONDS=10
      - DELAY_SECONDS=5
```

```
docker run -e CONTAINER_NAME=container:port|api -e DELAY_SECONDS=10 -e FREQUENCY_SECONDS=60 jackthomson/simple-scheduler
```
