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
docker run -e CONTAINER_NAME=value1 -e DELAY_SECONDS=100 -e FREQUENCY_SECONDS jackthomson/simple-scheduler
```
