#!/bin/bash

# Set the name of your Java project
PROJECT_NAME="my-java-project"

# Set the version of your project
PROJECT_VERSION="1.0.0"

# Build the Java code using Maven
echo "Building Java code..."
mvn clean install
if [ $? -eq 0 ]
then
        sudo apt install maven`
       echo "mvn installed successfully"
else
 mvn clean install`
if

# Check if Maven build succeeded
if [ $? -eq 0 ]; then
    echo "Java code built successfully."
else
    echo "Error: Maven build failed."
    exit 1
fi

# Build the Docker image
echo "Building Docker image..."
docker build -t "$PROJECT_NAME:$PROJECT_VERSION" .

# Check if Docker image build succeeded
if [ $? -eq 0 ]; then
    echo "Docker image built successfully."
else
    echo "Error: Docker image build failed."
    exit 1
fi

# Optionally, you can push the Docker image to a Docker registry
# Uncomment and modify the following lines if needed
# DOCKER_REGISTRY="your-docker-registry.com"
# docker tag "$PROJECT_NAME:$PROJECT_VERSION" "$DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION"
# docker push "$DOCKER_REGISTRY/$PROJECT_NAME:$PROJECT_VERSION"

echo "Process completed successfully."
