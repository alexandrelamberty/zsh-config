# ZSH configuration

## Roadmap

- [ ] Fix Stow exclude plugins folder
- [ ] Add plugin manager
- [ ] Completion, fzf ? share with neovim ?
- [ ] Erros prompt sourcing .zshenv vs manual sourcing of exports

## Features

- Custom prompt with git status
- Aliases
- Syntax highlighting
- Autosuggestions
- Custom functions

## Installation

To install the Zsh configuration, run the `install.sh` script located in this directory:

```bash
./install.sh
```
This script will back up any existing `.zshrc` file and `.config/zsh` directory in your home directory, remove them, and then create new symbolic links to the configuration files in this directory.

## Structure

The main configuration file is `.zshrc`, which is placed in the user's home directory. Additional configuration files and plugins are stored in the `.config/zsh` directory.

## References

- <https://wiki.archlinux.org/index.php/Zsh>
- <https://zsh.sourceforge.io/Doc/>
- <https://notes.alexandrelamberty.com/zsh>
