# ZSH configuration

Welcome to the repository for my ZSH configuration! This repository contains my
personalized setup for the Zsh shell, including various settings, aliases,
keybindings, plugins, and more.

## Roadmap

- [ ] Add plugin manager

## Features

- **Customization**: Tailored settings, aliases, and keybindings to enhance
productivity and usability.
- **Plugin Support**: Integration with various plugins to extend Zsh's
functionality.
- **Structured Configuration**: Organized file structure for easy navigation
and management.

## Requirements

- [Stow]()

## Installation

To install this ZSH configuration:

1. Clone this repository to your local machine.
2. Navigate to the repository directory.
3. Run the `install.sh` script provided in the root directory.
4. After installation, logout and login again to apply the changes.

## Structure

The repository follows a structured organization that mirrors the configuration
setup for applications in the `XDG_CONFIG_HOME` or `$HOME` directory using
Stow:

- **config**: Contains the ZSH configuration files structured to mimic the
application configuration directories.
  - **.config/zsh**: Configuration directory for Zsh.
    - **aliases.zsh**: File containing user-defined aliases.
    - **completions**: Directory for completion scripts.
    - **completion.zsh**: File for configuring completion settings.
    - **functions.zsh**: File for defining custom functions.
    - **keybindings.zsh**: File for configuring keybindings.
    - **plugins**: Directory for Zsh plugins.
    - **prompt.zsh**: File for configuring the prompt.
    - **settings.zsh**: File for configuring various settings.
    - **vim-mode.zsh**: File for configuring Vim mode settings.
    - **.zcompdump**: Zsh completion cache files.
    - **.zprofile**: Zsh profile file.
    - **.zshenv**: Zsh environment file.
    - **.zsh_history**: Zsh history file.
    - **.zshrc**: Main Zsh configuration file.
- **install.sh**: Installation script for deploying the configuration using
Stow.

## References

For more information about Zsh and related resources, you can refer to:

- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Notes on Zsh by Alexandre Lamberty](https://notes.alexandrelamberty.com/zsh)

Feel free to explore, customize, and contribute to this Zsh configuration! If
you encounter any issues or have suggestions for improvement, please open an
issue or submit a pull request.
