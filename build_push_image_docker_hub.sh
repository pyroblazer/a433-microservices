#!/bin/bash

# Nama image yang akan dibuat
IMAGE_NAME=item-app:v1

# Username Docker Hub
DOCKER_HUB_USERNAME=pyroblazer

# Perintah untuk membuat Docker image dari Dockerfile
docker build -t $IMAGE_NAME .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format Docker Hub
docker tag $IMAGE_NAME $DOCKER_HUB_USERNAME/$IMAGE_NAME

# Login ke Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login -u $DOCKER_HUB_USERNAME --password-stdin

# Mengunggah image ke Docker Hub
docker push $DOCKER_HUB_USERNAME/$IMAGE_NAME

# Cleanup: menghapus image lokal
docker rmi $IMAGE_NAME