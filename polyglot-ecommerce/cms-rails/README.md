# CMS Rails API

A Ruby on Rails API for managing blog content, part of the polyglot e-commerce platform.

## Features

- **RESTful API** for blog posts, authors, categories, and comments
- **Content Management** with full CRUD operations
- **Category System** for organizing blog posts
- **Comment System** with moderation capabilities
- **CORS Support** for frontend integration

## API Endpoints

### Posts
- `GET /api/v1/posts` - List all published posts
- `GET /api/v1/posts/:id` - Get a specific post with comments
- `POST /api/v1/posts` - Create a new post
- `PUT /api/v1/posts/:id` - Update a post
- `DELETE /api/v1/posts/:id` - Delete a post

### Authors
- `GET /api/v1/authors` - List all authors
- `GET /api/v1/authors/:id` - Get author with their posts
- `POST /api/v1/authors` - Create a new author
- `PUT /api/v1/authors/:id` - Update an author
- `DELETE /api/v1/authors/:id` - Delete an author

### Categories
- `GET /api/v1/categories` - List all categories
- `GET /api/v1/categories/:id` - Get category with posts
- `POST /api/v1/categories` - Create a new category
- `PUT /api/v1/categories/:id` - Update a category
- `DELETE /api/v1/categories/:id` - Delete a category

### Comments
- `GET /api/v1/posts/:post_id/comments` - List approved comments for a post
- `POST /api/v1/posts/:post_id/comments` - Create a new comment
- `DELETE /api/v1/posts/:post_id/comments/:id` - Delete a comment

## Models

### Author
- `name` (string, required)
- `email` (string, required, unique)
- `bio` (text, optional)

### Category
- `name` (string, required, unique)
- `slug` (string, auto-generated from name)
- `description` (text, optional)

### Post
- `title` (string, required)
- `slug` (string, auto-generated from title)
- `content` (text, required)
- `excerpt` (text, optional)
- `published` (boolean, default: false)
- `author_id` (foreign key)

### Comment
- `author_name` (string, required)
- `author_email` (string, required)
- `content` (text, required)
- `approved` (boolean, default: false)
- `post_id` (foreign key)

## Setup

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Setup database:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

3. Start the server:
   ```bash
   rails server -p 3001
   ```

The API will be available at `http://localhost:3001`

## Integration

This CMS API is designed to be consumed by the React frontend in the main e-commerce application, providing blog functionality to enhance the overall platform.