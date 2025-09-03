# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a monorepo-style project using Git submodules with two main components:
- `frontend/` - Next.js 15 application with React 19, TypeScript, and Tailwind CSS
- `backend/` - Ruby TDD project with RSpec and RuboCop

## Development Commands

### Frontend (Next.js)
Navigate to `frontend/` directory:
- `npm run dev` - Start development server with Turbopack
- `npm run build` - Build for production with Turbopack  
- `npm run start` - Start production server

### Backend (Ruby with Docker)
All backend commands use Docker Compose:
- `docker-compose up -d --build` - Build and run the container
- `docker-compose exec app rspec` - Run tests
- `docker-compose exec app rubocop` - Run linter
- `docker-compose exec app ruby lib/main.rb` - Run main application
- `docker-compose exec app irb` - Start Ruby REPL
- `docker-compose exec app sh` - Access container shell
- `docker-compose down` - Stop container

## Git Submodules
The project uses Git submodules for backend and frontend components. When working with submodules:
- Backend submodule: https://github.com/simonlehmann/demo-backend
- Frontend submodule: https://github.com/simonlehmann/demo-frontend

## Technology Stack
- Frontend: Next.js 15, React 19, TypeScript, Tailwind CSS v4
- Backend: Ruby 3.1.2, RSpec 3.11, RuboCop 1.25.1
- Containerization: Docker with Docker Compose