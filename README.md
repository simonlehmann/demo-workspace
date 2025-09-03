# TDD Starter Project
A Ruby TDD starter Project

## Setup

### With Docker Compose

#### 1. Build and run the container
```
docker-compose up -d --build
```

#### 1. Run Rspec
```
docker-compose exec app rspec
```

#### 1. Run Rubocop
```
docker-compose exec app rubocop
```

#### 1. Run sh
```
docker-compose exec app sh
```

#### 1. Run irb
```
docker-compose exec app irb
```

#### 1. Run a file
```
docker-compose exec app ruby lib/main.rb
```

#### 2. Exit the container
```
docker-compose down
```
