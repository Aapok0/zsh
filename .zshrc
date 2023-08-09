### PATH
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$PATH


### HISTORY CONFIG
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/.zsh_history

# History won't save duplicates or lines starting with space, search won't show duplicates, history is incrementally appended and history is shared between terminals
setopt histignorealldups histfindnodups histignorespace incappendhistory sharehistory


### DEFAULT EDITOR
export EDITOR='nvim'
export VISUAL='nvim'


### COMPLETIONS
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


### PROMPT THEME
# Spaceship theme - install from https://github.com/spaceship-prompt/spaceship-prompt
source $ZDOTDIR/themes/spaceship-prompt/spaceship.zsh-theme

# Spaceship config - https://spaceship-prompt.sh/config/prompt/#Prompt-order
SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    exec_time     # Execution time
    line_sep      # Line break
    #vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

### PLUGINS

# Fast-Syntax-Highlighting - install from https://github.com/zdharma-continuum/fast-syntax-highlighting
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# ZSH-Autosuggestions - install from https://github.com/zsh-users/zsh-autosuggestions
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH-Completions - install from https://github.com/zsh-users/zsh-completions
fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)

### ALIASES AND KEYBINDINGS
# Use vim keybindings even if EDITOR is set to something else
bindkey -e

# Enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Listing aliases with ls
#alias ll='ls -lahF --group-directories-first'
#alias la='ls -A'
#alias l='ls -CF'

# Listing aliases with exa
alias ls='exa'
alias ll='exa -lahF --icons --group-directories-first'
alias la='exa -a --icons'

# Alias tree to exa
alias tree='exa -aFT --icons'

# Alias zoxide to cd
#alias z='cd'

# Always use nvim
alias vim='nvim'

# Shorter alias for batcat
alias bat='batcat'

# New tmux session with name
alias tmuxn='tmux new-session -s'
# Attach to tmux session with name
alias tmuxa='tmux attach-session -t'

# Shorter alias for terraform
alias tf='terraform'


### COMMAND LINE TOOLS
# add flyctl to PATH
export FLYCTL_INSTALL="/home/aapoko/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/aapoko/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zoxide
eval "$(zoxide init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
