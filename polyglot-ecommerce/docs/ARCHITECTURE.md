# Polyglot E-Commerce Platform Architecture

## Overview

This project demonstrates a modern microservices architecture using multiple technologies to build a complete e-commerce platform with content management capabilities.

## Architecture Diagram

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React.js      │    │   Angular       │    │   Rails CMS     │
│   Storefront    │    │   Admin         │    │   Blog API      │
│   Port: 3000    │    │   Port: 4200    │    │   Port: 3001    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                        │                        │
         │                        │                        │
         └────────────────────────┼────────────────────────┘
                                  │
                     ┌─────────────────┐
                     │   Java Spring   │
                     │   Boot API      │
                     │   Port: 8080    │
                     └─────────────────┘
                              │
                    ┌─────────┴─────────┐
           ┌─────────────────┐ ┌─────────────────┐
           │   PostgreSQL    │ │   PostgreSQL    │
           │   Main DB       │ │   CMS DB        │
           │   Port: 5432    │ │   Port: 5433    │
           └─────────────────┘ └─────────────────┘
```

## Technology Stack

### Frontend Technologies

#### React.js Storefront
- **Purpose**: Customer-facing e-commerce website
- **Key Features**:
  - Product catalog with search and filtering
  - Shopping cart functionality
  - User authentication and registration
  - Order management
  - Responsive design with Material-UI
- **Technologies**: React 18, TypeScript, Material-UI, Axios, React Router

#### Angular Admin Dashboard
- **Purpose**: Administrative interface for managing the platform
- **Key Features**:
  - Product CRUD operations
  - Order management and status updates
  - Analytics dashboard with charts
  - User management
  - Modern Angular Material design
- **Technologies**: Angular 15+, TypeScript, Angular Material, Chart.js, RxJS

### Backend Technologies

#### Java Spring Boot API
- **Purpose**: Core e-commerce business logic and data management
- **Key Features**:
  - RESTful API with comprehensive endpoints
  - JWT-based authentication and authorization
  - Product catalog management
  - Order processing and inventory management
  - Role-based access control (Customer/Admin)
  - Database integration with JPA/Hibernate
- **Technologies**: Spring Boot 3, Spring Security, Spring Data JPA, PostgreSQL, JWT

#### Ruby on Rails CMS
- **Purpose**: Content management system for blog functionality
- **Key Features**:
  - Blog post management with rich content
  - Author and category management
  - Comment system with moderation
  - RESTful API for content delivery
  - CORS support for frontend integration
- **Technologies**: Ruby on Rails 7, PostgreSQL, Active Record

### Database Layer

#### PostgreSQL Databases
- **Main Database** (Port 5432): Stores e-commerce data (users, products, orders)
- **CMS Database** (Port 5433): Stores blog content (posts, authors, categories, comments)

## Communication Patterns

### API Communication
- **REST APIs**: All backend services expose RESTful endpoints
- **JSON**: Standard data exchange format
- **CORS**: Configured for cross-origin requests
- **Authentication**: JWT tokens for secure API access

### Data Flow
1. **Customer Journey**:
   ```
   React App → Java API → PostgreSQL (Main)
   React App → Rails API → PostgreSQL (CMS)
   ```

2. **Admin Operations**:
   ```
   Angular App → Java API → PostgreSQL (Main)
   ```

3. **Content Management**:
   ```
   Rails Admin → Rails API → PostgreSQL (CMS)
   React App → Rails API (Blog Content)
   ```

## Security Implementation

### Authentication & Authorization
- **JWT Tokens**: Stateless authentication
- **Role-Based Access**: Customer vs Admin permissions
- **Password Hashing**: BCrypt for secure password storage
- **CORS Configuration**: Controlled cross-origin access

### API Security
- **Input Validation**: Server-side validation for all inputs
- **SQL Injection Prevention**: Parameterized queries and ORM
- **XSS Protection**: Input sanitization and CSP headers

## Scalability Features

### Microservices Architecture
- **Separation of Concerns**: Each service has a specific responsibility
- **Independent Deployment**: Services can be deployed and scaled independently
- **Technology Diversity**: Best tool for each job
- **Fault Isolation**: Failure in one service doesn't affect others

### Database Design
- **Normalized Schema**: Efficient data storage and retrieval
- **Indexing**: Optimized queries for common operations
- **Connection Pooling**: Efficient database connection management

## Development Workflow

### Local Development
1. **Database Setup**: PostgreSQL containers with Docker
2. **Service Startup**: Individual development servers
3. **Hot Reloading**: Automatic refresh during development
4. **API Testing**: RESTful endpoints with proper error handling

### Production Deployment
1. **Containerization**: Docker containers for each service
2. **Orchestration**: Docker Compose for multi-service deployment
3. **Environment Configuration**: Environment-specific settings
4. **Monitoring**: Logging and health checks

## Key Design Decisions

### Why This Architecture?
1. **Skill Demonstration**: Showcases proficiency in multiple technologies
2. **Real-World Relevance**: Reflects modern enterprise architecture patterns
3. **Scalability**: Each component can scale independently
4. **Maintainability**: Clear separation of concerns and responsibilities

### Technology Choices
- **Java Spring Boot**: Enterprise-grade backend with robust ecosystem
- **React**: Popular, flexible frontend framework with rich ecosystem
- **Angular**: Comprehensive framework perfect for admin dashboards
- **Ruby on Rails**: Rapid development for content management features
- **PostgreSQL**: Reliable, feature-rich relational database

## Performance Considerations

### Frontend Optimization
- **Code Splitting**: Lazy loading for better initial load times
- **Caching**: Browser caching for static assets
- **Responsive Design**: Optimized for all device sizes

### Backend Optimization
- **Database Indexing**: Fast query execution
- **Connection Pooling**: Efficient resource utilization
- **Stateless Design**: Horizontal scalability

## Future Enhancements

### Potential Additions
1. **Redis Caching**: Session storage and API response caching
2. **Message Queues**: Asynchronous processing for orders
3. **Search Engine**: Elasticsearch for advanced product search
4. **CDN Integration**: Static asset delivery optimization
5. **API Gateway**: Centralized routing and rate limiting
6. **Monitoring**: Application performance monitoring (APM)

This architecture demonstrates modern software development practices while maintaining simplicity and clarity for educational purposes.