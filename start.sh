#!/bin/bash

echo "🚀 Run Jenkins with Docker Compose..."

echo "🛑 Stopping existing containers..."
docker-compose down

echo "🔨 Build Jenkins image..."
docker-compose build

echo "🚀 Start Jenkins services..."
docker-compose up -d

echo "⏳ Waiting for Jenkins to start..."
sleep 10

echo "📊 Containers status:"
docker-compose ps

echo "🎉 Jenkins successfully started!"