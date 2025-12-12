# ZSH configuration

## Roadmap

- [ ] Fix Stow exclude plugins folder
- [ ] Completion, fzf ? share with neovim ?

## Features

- Custom prompt with git status
- Aliases
- Syntax highlighting
- Autosuggestions

## Installation

To install the Zsh configuration, run the `install.sh` script located in this directory:

```bash
./install.sh            # standard install
./install.sh --dry-run  # preview the changes without touching your $HOME
```

This script safely removes the previous install (if present), cleans up legacy files, and then stows the current configuration. Use `--quiet` to silence verbose stow output.

## Structure

The main configuration file is `.zshrc`, which is placed in the user's home directory. Additional configuration files and plugins are stored in the `.config/zsh` directory.

## References

- <https://wiki.archlinux.org/index.php/Zsh>
- <https://zsh.sourceforge.io/Doc/>
- <https://notes.alexandrelamberty.com/zsh>
