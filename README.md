# 🚀 Linux Setup Script

This repository contains scripts to automate the setup of a **Linux development environment** with essential tools, programming languages, terminal configurations, and additional applications.

## 📥 Installation

1. **Clone the repository:**

```bash
git clone https://github.com/your-username/linux-setup.git
cd linux-setup
```

2. **Run the install script**

```bash
./install.sh
```

The script will prompt you for each tool, allowing you to skip unnecessary installations.

## ⚙️ Available Install Scripts

| Script                       | Description                                          |
| ---------------------------- | ---------------------------------------------------- |
| install.sh                   | Main setup script (asks for each install)            |
| scripts/install_misc.sh      | Installs essential tools (Git, Curl, Wget, etc.)     |
| scripts/install_postgres.sh  | Installs PostgreSQL and creates a database           |
| scripts/install_node.sh      | Installs Node.js via package manager                 |
| scripts/install_zsh.sh       | Installs Zsh, Oh My Zsh, and plugins                 |
| scripts/install_starship.sh  | Installs Starship prompt and applies a custom config |
| scripts/install_ghostty.sh   | Installs Ghostty terminal                            |
| scripts/install_albert.sh    | Installs Albert launcher and enables autostart       |
| scripts/create_ssh_key.sh    | Generates an SSH key for GitHub/GitLab               |
| scripts/create_dev_folder.sh | Create a Dev folder in the user Home                 |

## 📦 Apps to Install (Manually)

### Dev apps

- VSCode
- Cursor AI

### Misc app

- Spotify
- Discord
- Flameshot
