# Demo Workspace

This workspace repository provides a unified development environment for our full-stack application, bringing together the backend and frontend repositories as Git submodules for streamlined development and tooling.

## Architecture

```
my-project-workspace/
├── backend/          # Git submodule → backend-repo
├── frontend/         # Git submodule → frontend-repo
├── justfile          # Task automation
├── docker-compose.yml # Development environment
└── README.md         # This file
```

## Prerequisites

### Install Just
`just` is a modern task runner that replaces Make with better syntax and features.

```bash
# macOS
brew install just

# Linux (Ubuntu/Debian)
sudo apt install just
# or
cargo install just

# Windows
cargo install just
# or
scoop install just

# Other platforms: https://github.com/casey/just#installation
```

## Quick Start

### First Time Setup
```bash
# Clone this workspace repository
git clone <workspace-repo-url>
cd my-project-workspace

# Initialize submodules and set everything up
just setup

# Update to latest code
just update
```

### For Existing Clones
If you've already cloned this repo before submodules were added:
```bash
git pull
just setup
```

## Daily Workflow

### Start of Day
```bash
# Get latest changes from all repositories
just update
```

### During Development
Work in the individual repositories as normal:
```bash
# Backend development
cd backend
git checkout main && git pull
# Make your changes, commit, push as usual

# Frontend development  
cd frontend
git checkout main && git pull
# Make your changes, commit, push as usual
```

### End of Day / Feature Complete
```bash
# Update workspace to reference latest commits
just commit-workspace

# Or with a custom message
just commit-workspace "Complete user authentication feature"
```

## Available Commands

Run `just` or `just --list` to see all available commands:

### Core Workflow
- `just setup` - Initialize submodules (run once for new clones)
- `just update` - Pull latest changes and update submodules
- `just commit-workspace [MESSAGE]` - Commit submodule updates to workspace
- `just status` - Quick status check of workspace and submodules

### Development Environment
- `just dev` - Start development environment (Docker Compose)
- `just dev-down` - Stop development environment
- `just reset` - Clean and reset workspace to latest state

### Utilities
- `just clean` - Reset submodules to committed state
- `just help` - Show available commands

## Understanding Git Submodules

### Key Concepts
- **Submodules are pinned to specific commits** - This workspace tracks exact commit SHAs from backend and frontend repos
- **Detached HEAD state** - When you `cd` into a submodule, always `git checkout main` before making changes
- **Two-step process** - Changes go to individual repos first, then workspace gets updated to reference new commits

### Submodule Status
```bash
# See current submodule commit references
git submodule status

# See if submodules have local changes
just status
```

## Development Environment

### Docker Compose
The workspace includes a `docker-compose.yml` that orchestrates both backend and frontend services:

```bash
# Start everything
just dev

# View logs
docker-compose logs -f

# Stop everything
just dev-down
```

### Claude Code Integration
This workspace is optimized for Claude Code sessions:

1. Run `just update` to ensure latest code
2. Start Claude Code from the workspace root
3. Claude Code will have visibility into both backend and frontend codebases
4. Use `just commit-workspace` when Claude Code makes changes to both repos

## Troubleshooting

### Submodule Issues
```bash
# If submodules get into a weird state
just clean
just update

# Nuclear option - completely reset everything
git submodule deinit --all
just setup
```

### Common Gotchas
1. **Always `git checkout main`** in submodules before making changes
2. **Remember to push individual repos** before running `just commit-workspace`
3. **Team members need to run `just update`** after you push workspace changes

### Getting Help
- Run `just` to see all commands
- Check individual repo READMEs for repo-specific setup
- For Git submodule questions: [Git Submodules Documentation](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

## Team Collaboration

### When You Make Changes
1. Work and commit in individual repos (backend/, frontend/)
2. Push your changes to the respective repositories
3. Run `just commit-workspace "Descriptive message"`
4. Push the workspace changes

### When Team Members Make Changes
1. Run `just update` to get their latest workspace changes
2. This automatically updates your submodules to the commits they were working with

### CI/CD Integration
- Individual repositories maintain their own CI/CD pipelines
- Workspace-level automation can be added to the `justfile` as needed
- Consider adding a workspace-level CI that validates the integration

## Repository Links
- **Backend Repository**: [link-to-backend-repo]
- **Frontend Repository**: [link-to-frontend-repo]
- **Project Documentation**: [link-to-main-docs]

---

*This workspace uses Git submodules and Just for streamlined full-stack development. For questions or improvements, please open an issue or reach out to the development team.*