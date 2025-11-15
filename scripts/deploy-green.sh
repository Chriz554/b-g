#!/bin/bash
docker compose -f docker-compose.green.yml up -d --build
echo "GREEN DEPLOYED (port 3002)"