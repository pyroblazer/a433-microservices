#!/bin/bash

# Inisialisasi variabel GitHub username dan repository
GITHUB_USERNAME=pyroblazer
GITHUB_REPOSITORY=a433-microservices
GITHUB_REGISTRY=ghcr.io  # URL Registri Kontainer GitHub

# Menyusun nama image dengan format yang sesuai untuk GitHub Packages
IMAGE_NAME=$GITHUB_REGISTRY/$GITHUB_USERNAME/$GITHUB_REPOSITORY/item-app:v1

# Perintah untuk membuat Docker image dari Dockerfile
docker build -t $IMAGE_NAME .

# Melihat daftar image di lokal
docker images

# Login ke GitHub Packages menggunakan token akses pribadi (PAT)
echo $GITHUB_TOKEN | docker login $GITHUB_REGISTRY -u $GITHUB_USERNAME --password-stdin

# Mengunggah image ke GitHub Packages
docker push $IMAGE_NAME

# Cleanup: menghapus image lokal
docker rmi $IMAGE_NAME