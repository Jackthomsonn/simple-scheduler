#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

LOG_FILE="/var/log/container_requests.log"

echo -e "${BLUE}Jobs created and starting${NC} - Delaying execution for $DELAY_SECONDS seconds..."

sleep $DELAY_SECONDS

while true;
do
  TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
  RESPONSE=$(curl -s -w "%{http_code}" -o /dev/null -X GET $CONTAINER_NAME)
  
  if [ "$RESPONSE" -eq "200" ]; then
    COLOR=$GREEN
  elif [ "$RESPONSE" -ge "400" ]; then
    COLOR=$RED
  else
    COLOR=$YELLOW
  fi

  echo -e "${BLUE}$TIMESTAMP${NC} - Request to ${BLUE}$CONTAINER_NAME${NC} returned status code ${COLOR}$RESPONSE${NC}"

  echo "$TIMESTAMP - Request to $CONTAINER_NAME returned status code $RESPONSE" >> $LOG_FILE

  sleep $FREQUENCY_SECONDS
done
