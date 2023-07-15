# ZSH configuration file

ZSH configuration I currently use. I keep .zshrc, zsh_history, themes directory and plugins directory under ~/.zsh. For it to work I've had to define the history file path in .zshrc and link .zshrc the following way:

```
ln -s -T .zsh/.zshrc ~/.zshrc
```

Path in the beginning depends on the system you have. Plugins and themes need to be cloned from their Github repositories to themes and plugins directories before using them with the configuration. Same applies to the programs added to path at the end.

## Themes and plugins

[Spaceship prompt](https://github.com/spaceship-prompt/spaceship-prompt)
[Fast Syntax Highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
[ZSH Autosuggestions)](https://github.com/zsh-users/zsh-autosuggestions)
[ZSH Completions](https://github.com/zsh-users/zsh-completions)
