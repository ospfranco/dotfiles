#!/bin/bash

# name: Kill Docker
# icon: 🔪

echo "Killing all running containers"
docker kill $(docker ps -q)

echo "Removing all stopped containers"
docker container prune -f