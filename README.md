# ClamChowder 🥣🐚

<p align="center">
  <img src="image/logo.png" alt="ClamChowder Logo" width="300">
</p>

**ClamChowder** is a zsh-based command-line framework designed to scaffold, manage, and execute standardized operational command projects.

It helps you organize your routine scripts, SQL queries, and documentation into a consistent "recipe," making your operational tasks reproducible and easy to share.

## ✨ Key Features

- **Standardized Scaffolding**: Quickly create a new operational command with a pre-defined structure (`bin`, `config`, `doc`, `sql`).
- **Mustache Integration**: Built-in support for [mo](https://github.com/tests-always-included/mo) to render dynamic documentation and configurations.
- **Zsh Powered**: Leverages the power of Zsh for robust path handling and modern shell features.
- **Clean Separation**: Keeps your logic, configuration, and data (SQL) separate and organized.

## 🏗️ The "Recipe" Structure

Every command cooked by ClamChowder follows this layout:

```text
<cmd_name>/
├── bin/          # Execution logic (main)
├── config/       # Configuration values (auto-sourced)
├── doc/          # Dynamic documentation (Mustache templates)
└── sql/          # SQL queries or raw data
```

## 🚀 Quick Start

### Prerequisites
- Zsh

### Installation
```bash
git clone --recursive https://github.com/your-repo/clamchowder.git
cd clamchowder
# Add bin/clamchowder to your PATH
```

### Basic Usage

1. **Cook** a new command:
   ```bash
   clamchowder cook my-new-task
   ```

2. **Taste** the documentation (renders Mustache templates):
   ```bash
   clamchowder taste my-new-task
   ```

3. **Serve** the command:
   ```bash
   clamchowder serve my-new-task
   ```

## 📘 Design Philosophy

For detailed architecture and internal workings, please refer to [DESIGN.md](./DESIGN.md).

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
