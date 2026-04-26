# ClamChowder

## Overview
`ClamChowder` is a zsh-based command-line framework designed to scaffold, manage, and execute standardized "operational command projects." 
As the name suggests, it acts like a soup that brings various operational commands (ingredients) together into a cohesive structure.

## Architecture

### 1. Framework Structure
```text
clamchowder/
├── bin/
│   └── clamchowder         # Main entry point (zsh)
├── lib/
│   ├── core.zsh            # Core framework logic
│   ├── mo/                 # Mustache template engine (Git Submodule)
│   └── ui.zsh              # UI and logging utilities
├── skeleton/               # Templates for new operational commands
│   ├── bin/
│   │   └── main.zsh        # Execution logic template
│   ├── config/
│   │   └── main.zsh        # Configuration template
│   ├── doc/
│   │   └── explanation.mo  # Documentation template (Mustache)
│   └── sql/
│       └── query.sql       # SQL query template
└── DESIGN.md               # This document
```

### 2. Standard Operational Command Structure
Commands generated via `clamchowder cook <name>` follow this convention:

```text
<cmd_name>/
├── bin/
│   └── main                # The logic of the command
├── config/
│   └── main                # Config values (auto-sourced before execution)
├── doc/
│   └── explanation.mo      # Dynamic documentation rendered via 'mo'
└── sql/
    └── query.sql           # SQL queries or data logic
```

## Subcommands

*   `clamchowder cook <name>`: Scaffolds a new operational command structure from the `skeleton/`.
*   `clamchowder list`: Lists all managed operational commands.
*   `clamchowder taste <name>`: Renders and displays the `doc/explanation.mo` using `mo`.
*   `clamchowder serve <name> [args]`: Executes the specified command. It automatically sources `config/main` before running `bin/main`.

## External Dependencies
*   **mo**: A Mustache template engine. Integrated as a Git Submodule in `lib/mo` for dynamic document rendering.
