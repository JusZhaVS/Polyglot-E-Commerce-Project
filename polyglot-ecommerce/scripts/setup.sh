#!/bin/bash

echo "Setting up Polyglot E-Commerce Platform..."

# Create sample data for Java backend
echo "Setting up sample data..."

cat > ../backend-java/src/main/resources/data.sql << 'EOF'
-- Insert sample categories
INSERT INTO categories (name, description) VALUES 
('Electronics', 'Electronic devices and gadgets'),
('Clothing', 'Fashion and apparel'),
('Books', 'Books and literature'),
('Home & Garden', 'Home improvement and gardening');

-- Insert sample products
INSERT INTO products (name, description, price, stock, image_url, category_id, active, created_at, updated_at) VALUES 
('Laptop Pro', 'High-performance laptop for professionals', 1299.99, 50, 'https://via.placeholder.com/300x200', 1, true, NOW(), NOW()),
('Smartphone X', 'Latest smartphone with advanced features', 899.99, 100, 'https://via.placeholder.com/300x200', 1, true, NOW(), NOW()),
('Designer T-Shirt', 'Premium cotton t-shirt with modern design', 39.99, 200, 'https://via.placeholder.com/300x200', 2, true, NOW(), NOW()),
('Jeans Classic', 'Comfortable and stylish denim jeans', 79.99, 150, 'https://via.placeholder.com/300x200', 2, true, NOW(), NOW()),
('Programming Guide', 'Complete guide to modern web development', 49.99, 75, 'https://via.placeholder.com/300x200', 3, true, NOW(), NOW()),
('Garden Tools Set', 'Complete set of essential gardening tools', 129.99, 30, 'https://via.placeholder.com/300x200', 4, true, NOW(), NOW());

-- Create admin user (password: admin123)
INSERT INTO users (email, password, first_name, last_name, role, enabled) VALUES 
('admin@example.com', '$2a$10$xn3LI/AjqicNYZQCYFQOeOzr3n9x3hCu.z5c5m2sJ9q5wH9X.UB6u', 'Admin', 'User', 'ADMIN', true),
('customer@example.com', '$2a$10$xn3LI/AjqicNYZQCYFQOeOzr3n9x3hCu.z5c5m2sJ9q5wH9X.UB6u', 'John', 'Customer', 'CUSTOMER', true);
EOF

echo "Sample data prepared"

# Create environment files
echo "Creating environment configuration..."

# Backend environment
cat > ../backend-java/.env << 'EOF'
DATABASE_URL=jdbc:postgresql://localhost:5432/ecommerce_db
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=postgres
JWT_SECRET=404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970
EOF

# React environment
cat > ../frontend-react/.env << 'EOF'
REACT_APP_API_URL=http://localhost:8080/api
REACT_APP_CMS_URL=http://localhost:3001/api/v1
EOF

# Angular environment
mkdir -p ../admin-angular/src/environments
cat > ../admin-angular/src/environments/environment.ts << 'EOF'
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api'
};
EOF

echo "Environment files created"

echo "Setup complete! Next steps:"
echo ""
echo "1. Start PostgreSQL databases:"
echo "   docker run -d --name postgres-main -e POSTGRES_DB=ecommerce_db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:15"
echo "   docker run -d --name postgres-cms -e POSTGRES_DB=cms_rails_development -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5433:5432 postgres:15"
echo ""
echo "2. Start each service:"
echo "   Backend (Java): cd backend-java && mvn spring-boot:run"
echo "   Frontend (React): cd frontend-react && npm start"
echo "   Admin (Angular): cd admin-angular && npm start"
echo "   CMS (Rails): cd cms-rails && rails server -p 3001"
echo ""
echo "3. Or use Docker Compose:"
echo "   cd docker && docker-compose up"
echo ""
echo "Access points:"
echo "- React Storefront: http://localhost:3000"
echo "- Angular Admin: http://localhost:4200"
echo "- Java API: http://localhost:8080"
echo "- Rails CMS API: http://localhost:3001"