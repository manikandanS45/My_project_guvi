#!/bin/bash

ENV=$1

# Login to Docker
echo "🔐 Logging into Docker Hub..."
echo "$DOCKER_CREDS_TOKEN" | docker login -u "$DOCKER_CREDS_USR" --password-stdin 

# Set image tags based on environment
if [ "$ENV" = "prod" ]; then 
    TARGET_IMAGE="mani0045/prod:v1"   # Replace with actual repo
    docker tag webapp:v1 $TARGET_IMAGE
else
    TARGET_IMAGE="mani0045/dev:v1"    # Replace with actual repo
    docker tag webapp:v1 $TARGET_IMAGE 
fi

# Push the image
echo "📦 Pushing image to Docker Hub: $TARGET_IMAGE"  
if docker push "$TARGET_IMAGE"; then
    echo "✅ Image pushed successfully to Docker Hub: $TARGET_IMAGE"
else
    echo "❌ Failed to push image to Docker Hub: $TARGET_IMAGE"
    exit 1
fi
