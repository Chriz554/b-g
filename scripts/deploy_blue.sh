#!/bin/bash
docker build -t app_blue .
docker stop app_blue || true
docker rm app_blue || true
<<<<<<< HEAD
docker run -d --name app_blue -p 9080:3000 app_blue
=======

docker run -d --name app_blue -p 3001:3000 app_blue
echo "BLUE ready on port 3001"
>>>>>>> e1b59b4b3440297f57f563922c6e9b2f1f34733c
