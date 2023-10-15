#!/bin/bash

USERNAME="pyroblazer"

# Build Docker image
docker build -t "$USERNAME/karsajobs:latest" -f Dockerfile .

# Create a new image tag from the source image
docker tag "$USERNAME/karsajobs-ui:latest ghcr.io/$USERNAME/karsajobs-ui:latest"

# Login to GitHub Package
echo "$GITHUB_PACKAGES_TOKEN" | docker login ghcr.io -u "$USERNAME" --password-stdin

# Push image to GitHub Package
docker push "$USERNAME/karsajobs:latest"