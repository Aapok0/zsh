# ZSH configuration file

ZSH configuration I currently use. I keep .zshrc, .zsh_history and other zdotfiles and themes and plugins directory under ~/.config/zsh. For it to work I've had to define the history file path in .zshrc, redefine $ZDOTDIR in .zshenv and link .zshenv to home directory in the following way:

```bash
ln -s -T ~/.config/zsh/.zshenv ~/.zshenv
```

Path in the beginning depends on the system you have. Plugins and themes need to be cloned from their Github repositories to themes and plugins directories before using them with the configuration. Same applies to the programs added to path at the end, which need to be installed.

## Themes and plugins

- [Spaceship prompt](https://github.com/spaceship-prompt/spaceship-prompt)
- [Fast Syntax Highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [ZSH Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [ZSH Completions](https://github.com/zsh-users/zsh-completions)

## Core terminal programs

### neovim

Text/code editor I use. Config located [here](https://github.com/Aapok0/nvim).

### tmux

Session, window and pane manager. Config located [here](https://github.com/Aapok0/tmux).

### zoxide

Tool to make moving between directories faster. It remembers your old cd commands and can query them so you can move around with just a keyword.

### fzf

Fuzzy finder to look for files and commands more quickly. Easiest to install and configure from the source:

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Extra step for Mac

Dircolors don't exist in Mac be default, but they can be downloaded as part of coreutils:

```bash
brew install coreutils
```

Also add the following to .zshrc:

```bash
export PATH='/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH'
```
