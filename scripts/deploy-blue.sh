#!/bin/bash
docker compose -f docker-compose.blue.yml up -d --build
echo "BLUE DEPLOYED (port 3001)"