#!/bin/bash
ENV=$1

echo "Deploying the image"

if [ "$ENV" = "prod" ]; then
    docker tag image webapp:v1 prod:v1
    docker push prod:v1 # private repo
else
    docker tag webapp:v1 dev:v1
    docker push dev:v1  # public repo 
fi
echo "Image deployed successfully to Dockerhub repo."