# https://just.systems

# Set shell for commands
set shell := ["bash", "-c"]

# Default recipe (runs when you just type `just`)
default:
    @just --list

# Initialize submodules (run once for new clones)
setup:
    @echo "🚀 Setting up workspace..."
    git submodule update --init --recursive
    @echo "✅ Ready to go!"

# Pull latest changes and update submodules
update:
    @echo "🔄 Updating workspace..."
    git pull
    git submodule update --remote
    @echo "✅ Done!"

# Commit workspace submodule updates
commit-workspace message="Update submodules to latest commits":
    @echo "💾 Committing workspace changes..."
    git add backend frontend
    git commit -m "{{message}}"
    git push
    @echo "✅ Workspace updated!"

# Start development environment
dev:
    @echo "🔧 Starting development environment..."
    docker-compose up -d

# Stop development environment
dev-down:
    @echo "🛑 Stopping development environment..."
    docker-compose down

# Quick status check
status:
    @echo "📊 Git status:"
    git status --short
    @echo "\n📦 Submodule status:"
    git submodule status

# Clean up (reset submodules to committed state)
clean:
    @echo "🧹 Cleaning workspace..."
    git submodule foreach --recursive git clean -fd
    git submodule foreach --recursive git reset --hard
    @echo "✅ Workspace cleaned!"

# Full reset and update
reset: clean update

# Show help (this is the default anyway)
help:
    @just --list
