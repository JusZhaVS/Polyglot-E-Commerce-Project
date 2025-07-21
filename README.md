# Polyglot E-Commerce Platform

A comprehensive, feature-rich e-commerce platform showcasing modern microservices architecture and demonstrating proficiency across multiple technologies. This project serves as an excellent portfolio piece for full-stack developers, highlighting skills in Java, JavaScript, Ruby, and modern frameworks.

## Project Highlights

This platform demonstrates:
- **Microservices Architecture** with clear separation of concerns
- **Multiple Programming Languages** (Java, JavaScript, Ruby)
- **Modern Frontend Frameworks** (React, Angular)
- **Enterprise Backend Technologies** (Spring Boot, Ruby on Rails)
- **Professional Development Practices** (RESTful APIs, JWT auth, Docker)
- **Real-world E-commerce Features** (complete shopping experience)

## Architecture Overview

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React.js      │    │   Angular       │    │   Rails CMS     │
│   Storefront    │    │   Admin Panel   │    │   Blog API      │
│   Port: 3000    │    │   Port: 4200    │    │   Port: 3001    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                        │                        │
         └────────────────────────┼────────────────────────┘
                                  │
                     ┌─────────────────┐
                     │   Java Spring   │
                     │   Boot Core API │
                     │   Port: 8080    │
                     └─────────────────┘
                              │
                    ┌─────────┴─────────┐
           ┌─────────────────┐ ┌─────────────────┐
           │   PostgreSQL    │ │   PostgreSQL    │
           │   Main DB       │ │   CMS DB        │
           └─────────────────┘ └─────────────────┘
```

### Core Components

#### ReactJS Customer Storefront
- Modern e-commerce shopping experience
- Product catalog with search and filtering
- Shopping cart and checkout process
- User authentication and order history
- Responsive Material-UI design
- **Technologies**: React 18, TypeScript, Material-UI, Axios

#### Angular Admin Dashboard
- Comprehensive administrative interface
- Product management (CRUD operations)
- Order tracking and status updates
- Analytics dashboard with interactive charts
- User management system
- **Technologies**: Angular 15+, TypeScript, Angular Material, Chart.js

#### Java Spring Boot Core API
- Enterprise-grade RESTful API
- JWT-based authentication and authorization
- Product catalog and inventory management
- Order processing and user management
- Role-based access control
- **Technologies**: Spring Boot 3, Spring Security, Spring Data JPA, PostgreSQL

#### Ruby on Rails CMS
- Content management for blog functionality
- Author and category management
- Comment system with moderation
- SEO-friendly blog structure
- **Technologies**: Ruby on Rails 7, PostgreSQL, Active Record

## Quick Start

### Prerequisites
- Java 17+, Node.js 18+, Ruby 3.0+
- PostgreSQL 15+
- Docker & Docker Compose (optional)

### Option 1: Automated Setup (Recommended)
```bash
git clone <repository-url>
cd polyglot-ecommerce/scripts
./setup.sh
./dev-start.sh
```

### Option 2: Docker Deployment
```bash
cd polyglot-ecommerce/docker
docker-compose up -d
```

### Access Points
- **React Storefront**: http://localhost:3000
- **Angular Admin**: http://localhost:4200 (admin@example.com / admin123)
- **Java API**: http://localhost:8080
- **Rails CMS API**: http://localhost:3001

## Key Features

### Customer Experience
- Product browsing with advanced search
- Shopping cart with real-time updates
- User registration and authentication
- Order placement and tracking
- Responsive design for all devices
- Blog integration for content marketing

### Administrative Features
- Product management (add, edit, delete)
- Order management and status tracking
- User management and role assignment
- Analytics dashboard with sales metrics
- Content management for blog posts
- Comment moderation system

### Technical Features
- JWT-based stateless authentication
- RESTful API design patterns
- Microservices architecture
- Cross-Origin Resource Sharing (CORS)
- Database relationship modeling
- Input validation and security
- Docker containerization
- Environment-specific configurations

## Technology Stack

| Component | Technologies |
|-----------|-------------|
| **Frontend** | React 18, Angular 15+, TypeScript, Material-UI, Angular Material |
| **Backend** | Java Spring Boot 3, Ruby on Rails 7 |
| **Database** | PostgreSQL 15 |
| **Authentication** | JWT (JSON Web Tokens) |
| **API** | RESTful services with JSON |
| **Containerization** | Docker, Docker Compose |
| **Build Tools** | Maven, npm, Webpack |

## Sample Data

The platform includes realistic sample data:
- **6 Products** across 4 categories (Electronics, Clothing, Books, Home & Garden)
- **2 User Accounts** (Admin and Customer)
- **3 Blog Posts** with categories and comments
- **Complete Category Structure** for both products and blog content

## Project Structure

```
polyglot-ecommerce/
├── backend-java/           # Spring Boot API
│   ├── src/main/java/      # Java source code
│   ├── src/main/resources/ # Configuration files
│   └── pom.xml            # Maven dependencies
├── frontend-react/         # React storefront
│   ├── src/components/     # React components
│   ├── src/services/       # API services
│   └── package.json       # npm dependencies
├── admin-angular/          # Angular admin dashboard
│   ├── src/app/           # Angular application
│   ├── src/app/components/ # Angular components
│   └── package.json       # npm dependencies
├── cms-rails/             # Rails CMS API
│   ├── app/models/        # Rails models
│   ├── app/controllers/   # Rails controllers
│   └── Gemfile           # Ruby dependencies
├── docker/               # Docker configurations
│   └── docker-compose.yml # Multi-service setup
├── scripts/              # Automation scripts
│   ├── setup.sh          # Initial setup
│   ├── dev-start.sh      # Development startup
│   └── stop.sh           # Service shutdown
└── docs/                 # Documentation
    ├── ARCHITECTURE.md    # Detailed architecture
    └── GETTING_STARTED.md # Setup instructions
```

## Development Workflow

### Local Development
1. **Database Setup**: PostgreSQL containers with Docker
2. **Service Management**: Individual development servers with hot reloading
3. **API Testing**: Comprehensive REST endpoints
4. **Frontend Development**: Component-based architecture with state management

### Production Deployment
1. **Containerization**: Docker images for each service
2. **Orchestration**: Docker Compose for multi-service deployment
3. **Environment Management**: Configurable settings per environment
4. **Monitoring**: Logging and health checks

## Learning Outcomes

This project demonstrates proficiency in:

### Frontend Development
- **React Ecosystem**: Hooks, Context API, Material-UI, TypeScript
- **Angular Framework**: Services, Guards, Reactive Forms, Material Design
- **Modern JavaScript**: ES6+, async/await, module systems
- **State Management**: Context API, RxJS observables
- **Responsive Design**: Mobile-first approach, CSS-in-JS

### Backend Development
- **Java Enterprise**: Spring Boot, Spring Security, Spring Data JPA
- **Ruby on Rails**: MVC architecture, Active Record, RESTful routing
- **API Design**: RESTful principles, JSON APIs, status codes
- **Database Design**: Relational modeling, indexing, migrations
- **Security**: JWT authentication, password hashing, CORS

### DevOps & Architecture
- **Microservices**: Service separation, API communication
- **Containerization**: Docker, multi-stage builds
- **Database Management**: PostgreSQL, connection pooling
- **Development Tools**: Hot reloading, build automation
- **Documentation**: Technical writing, API documentation

## Future Enhancements

Potential additions to extend the platform:
- **Redis Caching**: Session storage and API response caching
- **Message Queues**: Asynchronous order processing
- **Search Engine**: Elasticsearch for advanced product search
- **Payment Integration**: Stripe or PayPal integration
- **Real-time Features**: WebSocket notifications
- **Mobile Apps**: React Native or Flutter applications
- **Analytics**: Google Analytics integration
- **Testing**: Comprehensive test suites
- **CI/CD**: GitHub Actions or Jenkins pipelines

## Documentation

- [**Architecture Guide**](docs/ARCHITECTURE.md) - Detailed system architecture and design decisions
- [**Getting Started**](docs/GETTING_STARTED.md) - Comprehensive setup and development guide
- [**API Documentation**](docs/API.md) - REST API endpoint reference
- **Component READMEs**: Each service includes its own documentation

## Contributing

This project serves as a portfolio demonstration, but contributions and suggestions are welcome! Please feel free to:
- Report issues or bugs
- Suggest new features
- Improve documentation
- Add test coverage

## License

This project is available under the MIT License. See LICENSE file for details.

---

**Built to demonstrate modern full-stack development skills across multiple technologies and architectural patterns.**