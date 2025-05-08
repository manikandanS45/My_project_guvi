#!/bin/bash
#build script
docker build -t webapp:v1 .
docker compose up -d