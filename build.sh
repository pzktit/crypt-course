#!/bin/bash

IMAGE_NAME="crypt-course"

echo "Building Docker image: $IMAGE_NAME"

docker build -t $IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "✔ Image '$IMAGE_NAME' built successfully."
else
    echo "✖ Build failed."
fi
