# Getting Started with Polyglot E-Commerce Platform

## Prerequisites

Before you begin, ensure you have the following installed on your system:

### Required Software
- **Java 17+** (for Spring Boot backend)
- **Node.js 18+** and **npm** (for React and Angular frontends)
- **Ruby 3.0+** and **Rails 7+** (for CMS backend)
- **PostgreSQL 15+** (database)
- **Docker & Docker Compose** (for containerized deployment)
- **Git** (version control)

### Optional Tools
- **Maven 3.8+** (if not using wrapper)
- **Your favorite IDE** (VS Code, IntelliJ IDEA, RubyMine)
- **Postman** or similar (for API testing)

## Quick Start (Development Mode)

### Option 1: Automated Setup (Recommended)

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd polyglot-ecommerce
   ```

2. **Run the setup script**:
   ```bash
   cd scripts
   ./setup.sh
   ```

3. **Start all services**:
   ```bash
   ./dev-start.sh
   ```

4. **Access the applications**:
   - React Storefront: http://localhost:3000
   - Angular Admin: http://localhost:4200
   - Java API: http://localhost:8080
   - Rails CMS API: http://localhost:3001

### Option 2: Manual Setup

#### 1. Database Setup

Start PostgreSQL databases using Docker:

```bash
# Main e-commerce database
docker run -d --name postgres-main \
  -e POSTGRES_DB=ecommerce_db \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  postgres:15

# CMS database
docker run -d --name postgres-cms \
  -e POSTGRES_DB=cms_rails_development \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5433:5432 \
  postgres:15
```

#### 2. Backend Services

**Java Spring Boot API**:
```bash
cd backend-java
mvn spring-boot:run
```
Access at: http://localhost:8080

**Ruby on Rails CMS**:
```bash
cd cms-rails
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server -p 3001
```
Access at: http://localhost:3001

#### 3. Frontend Applications

**React Storefront**:
```bash
cd frontend-react
npm install
npm start
```
Access at: http://localhost:3000

**Angular Admin Dashboard**:
```bash
cd admin-angular
npm install
npm start
```
Access at: http://localhost:4200

## Docker Deployment

### Prerequisites
- Docker and Docker Compose installed

### Steps

1. **Navigate to docker directory**:
   ```bash
   cd docker
   ```

2. **Start all services**:
   ```bash
   docker-compose up -d
   ```

3. **Check service status**:
   ```bash
   docker-compose ps
   ```

4. **View logs**:
   ```bash
   docker-compose logs -f [service-name]
   ```

5. **Stop all services**:
   ```bash
   docker-compose down
   ```

## Default Credentials

### Admin Access
- **Email**: admin@example.com
- **Password**: admin123

### Customer Access
- **Email**: customer@example.com
- **Password**: customer123

## API Endpoints

### Java Spring Boot API (Port 8080)

#### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

#### Products
- `GET /api/products` - List all products
- `GET /api/products/{id}` - Get product details
- `GET /api/products/search?query={term}` - Search products

#### Orders (Authenticated)
- `POST /api/orders` - Create order
- `GET /api/orders` - Get user orders
- `GET /api/orders/{id}` - Get order details

#### Admin Only
- `POST /api/admin/products` - Create product
- `PUT /api/admin/products/{id}` - Update product
- `DELETE /api/admin/products/{id}` - Delete product
- `PUT /api/admin/orders/{id}/status` - Update order status

### Rails CMS API (Port 3001)

#### Blog Posts
- `GET /api/v1/posts` - List published posts
- `GET /api/v1/posts/{id}` - Get post details
- `POST /api/v1/posts` - Create post
- `PUT /api/v1/posts/{id}` - Update post
- `DELETE /api/v1/posts/{id}` - Delete post

#### Authors
- `GET /api/v1/authors` - List authors
- `POST /api/v1/authors` - Create author

#### Categories
- `GET /api/v1/categories` - List categories
- `POST /api/v1/categories` - Create category

#### Comments
- `GET /api/v1/posts/{id}/comments` - Get post comments
- `POST /api/v1/posts/{id}/comments` - Create comment

## Sample Data

The system comes with pre-loaded sample data:

### Products
- Laptop Pro ($1,299.99)
- Smartphone X ($899.99)
- Designer T-Shirt ($39.99)
- Classic Jeans ($79.99)
- Programming Guide ($49.99)
- Garden Tools Set ($129.99)

### Blog Posts
- "The Future of E-Commerce: Trends to Watch in 2024"
- "Building Scalable Microservices with Modern Technologies"
- "Customer Experience: The Key to E-Commerce Success"

## Testing the System

### 1. Customer Flow (React App)
1. Visit http://localhost:3000
2. Browse products
3. Add items to cart
4. Register as a new user
5. Checkout and place order
6. View order history

### 2. Admin Flow (Angular App)
1. Visit http://localhost:4200
2. Login with admin credentials
3. View dashboard analytics
4. Manage products (CRUD operations)
5. View and update orders
6. Manage users

### 3. Content Management (Rails CMS)
1. Access API at http://localhost:3001/api/v1/posts
2. Create blog posts
3. Manage authors and categories
4. Moderate comments

## Troubleshooting

### Common Issues

#### Port Conflicts
If ports are already in use, update the port configurations:
- React: Change in `package.json` start script
- Angular: Use `ng serve --port 4201`
- Java: Update `server.port` in `application.properties`
- Rails: Use `rails server -p 3002`

#### Database Connection Issues
```bash
# Check if PostgreSQL containers are running
docker ps | grep postgres

# Restart containers if needed
docker restart postgres-main postgres-cms
```

#### Node.js Issues
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules
npm install
```

#### Java/Maven Issues
```bash
# Clean and rebuild
mvn clean install

# Skip tests if needed
mvn spring-boot:run -DskipTests
```

#### Rails Issues
```bash
# Bundle issues
bundle install

# Database issues
rails db:reset
rails db:seed
```

### Getting Help

1. **Check logs**: Service logs are available in the `logs/` directory
2. **API testing**: Use Postman or curl to test API endpoints
3. **Database inspection**: Connect to PostgreSQL to inspect data
4. **Browser console**: Check for frontend JavaScript errors

## Next Steps

After getting the system running:

1. **Explore the code**: Each service has detailed README files
2. **Make modifications**: Try adding new features or modifying existing ones
3. **Study the architecture**: Review the architecture documentation
4. **Add tests**: Implement unit and integration tests
5. **Deploy to cloud**: Try deploying to AWS, GCP, or Azure

## Development Tips

### Hot Reloading
All services support hot reloading during development:
- React: Automatic refresh on file changes
- Angular: Live reload with `ng serve`
- Spring Boot: Use Spring Boot DevTools
- Rails: Automatic code reloading

### Debugging
- **Frontend**: Use browser developer tools
- **Java**: Attach debugger to port 5005 (if debug mode enabled)
- **Rails**: Use `binding.pry` for breakpoints

### Code Quality
- **Frontend**: ESLint and Prettier configured
- **Java**: SpotBugs and Checkstyle recommended
- **Rails**: RuboCop for code style

This platform serves as an excellent foundation for learning modern web development practices and demonstrating full-stack capabilities across multiple technologies!