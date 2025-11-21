#!/bin/bash
docker build -t app_blue .
docker stop app_blue || true
docker rm app_blue || true

docker run -d --name app_blue -p 3001:3000 app_blue
echo "BLUE ready on port 3001"
