# ClamChowder Design Document

## Overview
`ClamChowder` is a zsh-based framework to scaffold, manage, and distribute standardized operational commands. It allows you to package logic, configuration, and documentation into a single directory and register it as a system-wide command.

## Core Concepts
1. **Standardized Structure**: Every command follows the same layout (bin, config, doc, sql), making it easy for team members to understand and maintain.
2. **Direct Execution via Symlinks**: Commands are meant to be linked to `/usr/local/bin`, allowing them to be executed directly while maintaining their internal structure.
3. **Dynamic Documentation**: Uses the Mustache template engine (`mo`) to render documentation with live configuration values.

## Directory Structure
```text
clamchowder/
├── bin/
│   └── clamchowder         # Framework CLI
├── lib/
│   ├── core.zsh            # Shared logic
│   ├── mo/                 # Mustache engine (Submodule)
│   └── ui.zsh              # UI utilities
├── skeleton/               # Template for 'cook' command
│   ├── bin/main.zsh        # Command logic
│   ├── config/main.zsh     # Configuration
│   ├── doc/explanation.mo  # Documentation
│   └── sql/query.sql       # Data/SQL
└── commands/               # (Optional) Default location for cooked commands
```

## Subcommands
- `cook <name>`: Generates a new command directory from skeletons.
- `link <name>`: Creates a symlink in `/usr/local/bin` to make the command available system-wide.
- `list`: Lists all commands within the managed directory.
- `taste <name>`: Renders the command's documentation.
- `serve <name>`: Executes the command through the framework (useful for debugging).
