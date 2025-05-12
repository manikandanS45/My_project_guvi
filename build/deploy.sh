#!/bin/bash
ENV=$1

echo "Deploying the image to Docker Hub..."

# Define the target image name based on environment
if [ "$ENV" = "prod" ]; then
    TARGET_IMAGE="mani0045/prod:v1"
else
    TARGET_IMAGE="mani0045/dev:v1"
fi

# Tag the image correctly
docker tag webapp:v1 $TARGET_IMAGE

# Push the image
if docker push $TARGET_IMAGE; then
    echo "✅ Image pushed successfully to Docker Hub: $TARGET_IMAGE"
else
    echo "❌ Failed to push image to Docker Hub: $TARGET_IMAGE"
    exit 1
fi
