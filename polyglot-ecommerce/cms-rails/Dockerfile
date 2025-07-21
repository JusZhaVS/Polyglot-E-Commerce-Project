FROM ruby:3.0-alpine

# Install dependencies
RUN apk add --no-cache \
    build-base \
    postgresql-dev \
    tzdata

WORKDIR /app

# Copy Gemfile and install gems
COPY Gemfile* ./
RUN bundle install

# Copy application code
COPY . .

# Expose port
EXPOSE 3001

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]