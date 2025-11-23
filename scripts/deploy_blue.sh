#!/bin/bash
docker build -t app_blue .
docker stop app_blue || true
docker rm app_blue || true
docker run -d --name app_blue -p 9080:3000 app_blue
