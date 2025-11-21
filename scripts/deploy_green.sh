#!/bin/bash
docker build -t app_green .
docker stop app_green || true
docker rm app_green || true
<<<<<<< HEAD
docker run -d --name app_green -p 9081:3000 app_green
=======

docker run -d --name app_green -p 3002:3000 app_green
echo "GREEN ready on port 3002"
>>>>>>> e1b59b4b3440297f57f563922c6e9b2f1f34733c
