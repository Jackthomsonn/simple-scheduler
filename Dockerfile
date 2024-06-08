FROM alpine:latest

RUN apk add --no-cache curl

ENV CONTAINER_NAME="http://localhost:8080"
ENV FREQUENCY_SECONDS=60

COPY api_call.sh /usr/local/bin/api_call.sh

RUN chmod +x /usr/local/bin/api_call.sh

ENTRYPOINT ["/usr/local/bin/api_call.sh"]