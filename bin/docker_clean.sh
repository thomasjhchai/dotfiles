#!/bin/bash

# Warning message
echo "WARNING: This script will stop and remove all Docker containers, images, and volumes. This action cannot be undone."
read -p "Are you sure you want to continue? (Y/n): " choice
if [[ "$choice" != "Y" ]]; then
    echo "Exiting without performing any actions."
    exit 0
fi

# Stop all running containers
echo "Stopping all running containers..."
docker stop $(docker ps -q)

# Remove all containers
echo "Removing all containers..."
docker rm $(docker ps -a -q)

# Remove all images
echo "Removing all images..."
docker rmi $(docker images -q) -f

# Remove all volumes
echo "Removing all volumes..."
docker volume rm $(docker volume ls -q)

echo "All containers, images, and volumes have been removed."

