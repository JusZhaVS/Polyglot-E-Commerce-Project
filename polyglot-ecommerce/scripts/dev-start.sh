#!/bin/bash

echo "Starting Polyglot E-Commerce Platform in Development Mode..."

# Function to check if a port is available
check_port() {
    if lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null ; then
        echo "Port $1 is already in use"
        return 1
    else
        echo "Port $1 is available"
        return 0
    fi
}

# Check required ports
echo "Checking required ports..."
check_port 3000 || exit 1  # React
check_port 4200 || exit 1  # Angular
check_port 8080 || exit 1  # Java
check_port 3001 || exit 1  # Rails
check_port 5432 || echo "Warning: PostgreSQL port 5432 may be in use (this is okay if you have a local PostgreSQL instance)"
check_port 5433 || echo "Warning: PostgreSQL port 5433 may be in use"

echo ""
echo "Starting PostgreSQL databases..."

# Start PostgreSQL containers if not running
if ! docker ps | grep -q postgres-main; then
    echo "Starting main PostgreSQL database..."
    docker run -d --name postgres-main \
        -e POSTGRES_DB=ecommerce_db \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_PASSWORD=postgres \
        -p 5432:5432 \
        postgres:15
fi

if ! docker ps | grep -q postgres-cms; then
    echo "Starting CMS PostgreSQL database..."
    docker run -d --name postgres-cms \
        -e POSTGRES_DB=cms_rails_development \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_PASSWORD=postgres \
        -p 5433:5432 \
        postgres:15
fi

# Wait for databases to be ready
echo "Waiting for databases to be ready..."
sleep 5

echo ""
echo "Starting all services..."

# Start services in background
echo "Starting Java Spring Boot backend..."
cd ../backend-java && mvn spring-boot:run > ../logs/backend.log 2>&1 &
JAVA_PID=$!

echo "Starting React frontend..."
cd ../frontend-react && npm start > ../logs/react.log 2>&1 &
REACT_PID=$!

echo "Starting Angular admin dashboard..."
cd ../admin-angular && npm start > ../logs/angular.log 2>&1 &
ANGULAR_PID=$!

echo "Starting Rails CMS..."
cd ../cms-rails && rails server -p 3001 > ../logs/rails.log 2>&1 &
RAILS_PID=$!

echo ""
echo "All services are starting up..."
echo ""
echo "Access Points:"
echo "- React Storefront: http://localhost:3000"
echo "- Angular Admin: http://localhost:4200 (login: admin@example.com / admin123)"
echo "- Java API: http://localhost:8080"
echo "- Rails CMS API: http://localhost:3001"
echo ""
echo "Logs are available in the logs/ directory"
echo ""
echo "To stop all services, run: ./stop.sh"
echo ""

# Save PIDs for stopping later
mkdir -p ../logs
echo $JAVA_PID > ../logs/java.pid
echo $REACT_PID > ../logs/react.pid
echo $ANGULAR_PID > ../logs/angular.pid
echo $RAILS_PID > ../logs/rails.pid

echo "Development environment is ready!"