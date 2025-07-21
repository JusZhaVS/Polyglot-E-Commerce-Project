# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create authors
john = Author.create!(
  name: "John Smith",
  email: "john@example.com",
  bio: "Senior technology writer with 10+ years of experience in e-commerce and web development."
)

jane = Author.create!(
  name: "Jane Doe",
  email: "jane@example.com",
  bio: "Marketing specialist focused on digital commerce trends and customer experience."
)

# Create categories
tech_category = Category.create!(
  name: "Technology",
  description: "Latest trends in technology and development"
)

ecommerce_category = Category.create!(
  name: "E-Commerce",
  description: "Insights into online retail and digital commerce"
)

marketing_category = Category.create!(
  name: "Marketing",
  description: "Digital marketing strategies and best practices"
)

# Create posts
post1 = Post.create!(
  title: "The Future of E-Commerce: Trends to Watch in 2024",
  content: "E-commerce continues to evolve rapidly, driven by technological advances and changing consumer behaviors. In this comprehensive guide, we explore the key trends that will shape the future of online retail...",
  excerpt: "Discover the emerging trends that will define e-commerce in 2024 and beyond.",
  author: john,
  published: true
)

post2 = Post.create!(
  title: "Building Scalable Microservices with Modern Technologies",
  content: "Microservices architecture has become the standard for building scalable, maintainable applications. Learn how to implement microservices using Java Spring Boot, Ruby on Rails, and modern frontend frameworks...",
  excerpt: "A practical guide to implementing microservices architecture in modern applications.",
  author: john,
  published: true
)

post3 = Post.create!(
  title: "Customer Experience: The Key to E-Commerce Success",
  content: "In today's competitive e-commerce landscape, customer experience is the primary differentiator. This article explores strategies for creating exceptional customer journeys...",
  excerpt: "Learn how to optimize customer experience to drive e-commerce growth.",
  author: jane,
  published: true
)

# Associate posts with categories
post1.categories << [ecommerce_category, marketing_category]
post2.categories << [tech_category]
post3.categories << [ecommerce_category, marketing_category]

# Create some comments
Comment.create!(
  post: post1,
  author_name: "Alex Johnson",
  author_email: "alex@example.com",
  content: "Great insights! The trend analysis is particularly helpful for planning our 2024 strategy.",
  approved: true
)

Comment.create!(
  post: post1,
  author_name: "Sarah Wilson",
  author_email: "sarah@example.com",
  content: "I'd love to see more data on mobile commerce trends. Do you have any statistics on mobile vs desktop conversion rates?",
  approved: true
)

Comment.create!(
  post: post2,
  author_name: "Mike Chen",
  author_email: "mike@example.com",
  content: "Excellent technical breakdown. The microservices approach you described aligns perfectly with our current architecture goals.",
  approved: true
)

puts "Seeded #{Author.count} authors"
puts "Seeded #{Category.count} categories"
puts "Seeded #{Post.count} posts"
puts "Seeded #{Comment.count} comments"