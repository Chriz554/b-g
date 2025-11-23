#!/bin/bash
docker build -t app_green .
docker stop app_green || true
docker rm app_green || true
docker run -d --name app_green -p 9081:3000 app_green
