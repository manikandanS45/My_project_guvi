#!/bin/bash
set -e

ENV=$1
REPO="mani0045"

echo "Deploying the image"

echo "$DOCKER_CREDS_PSW" | docker login -u "$DOCKER_CREDS_USR" --password-stdin

if [ "$ENV" = "prod" ]; then
    docker tag webapp:v1 mani0045/prod:v1
    docker push mani0045/prod:v1
else
    docker tag webapp:v1 $REPO:v1
    docker push $REPO:v1
fi

echo "✅ Image pushed to Docker Hub: $REPO:v1"