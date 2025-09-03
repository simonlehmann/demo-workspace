# Dockerfile

FROM ruby:3.1.2-alpine

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache build-base

ENV RUBYOPT='-W:no-deprecated'

# Install application dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set the default command
CMD ["sh"]
