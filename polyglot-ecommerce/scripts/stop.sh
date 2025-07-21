#!/bin/bash

echo "Stopping Polyglot E-Commerce Platform..."

# Stop application processes
if [ -f ../logs/java.pid ]; then
    echo "Stopping Java backend..."
    kill $(cat ../logs/java.pid) 2>/dev/null
    rm ../logs/java.pid
fi

if [ -f ../logs/react.pid ]; then
    echo "Stopping React frontend..."
    kill $(cat ../logs/react.pid) 2>/dev/null
    rm ../logs/react.pid
fi

if [ -f ../logs/angular.pid ]; then
    echo "Stopping Angular admin..."
    kill $(cat ../logs/angular.pid) 2>/dev/null
    rm ../logs/angular.pid
fi

if [ -f ../logs/rails.pid ]; then
    echo "Stopping Rails CMS..."
    kill $(cat ../logs/rails.pid) 2>/dev/null
    rm ../logs/rails.pid
fi

# Stop Docker containers
echo "Stopping PostgreSQL containers..."
docker stop postgres-main postgres-cms 2>/dev/null
docker rm postgres-main postgres-cms 2>/dev/null

echo "All services stopped!"