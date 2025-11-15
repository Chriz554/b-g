#!/bin/bash
docker build -t app_green ..
docker stop app_green || true
docker rm app_green || true
docker run -d --name app_green -p 3002:3000 app_green