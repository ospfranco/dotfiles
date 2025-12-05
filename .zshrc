parse_git_branch() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  [[ -n $branch ]] && echo " ($branch)"
}

my_ip () {
  ifconfig en0 | grep inet | grep -v inet6
}

gac () {
  git add .
  git commit -m "$1"
  git push --quiet
}

source ~/.zsh_secrets

if [[ "$OSTYPE" == darwin* ]]; then
  MACOS=1
else
  MACOS=0
fi

if (( MACOS )); then
  export HOMEBREW_PREFIX="/opt/homebrew"
else
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi

eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
eval "$(${HOMEBREW_PREFIX}/bin/mise activate zsh)"

# Homebrew vars
export HOMEBREW_DOWNLOAD_CONCURRENCY=auto
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_UPGRADE_GREEDY=1

FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit colors
compinit
colors

# Enable menu selection
zstyle ':completion:*' menu select

# Highlight current selection
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# Make directory selection distinct
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''

setopt autocd

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
CASE_SENSITIVE="true"
HISTDUP=erase

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

alias f='open -a Finder ./'                      
alias psa='ps -A'
alias psrep='ps -A | grep $1'
alias hrep='history | grep $1'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias gpp='git pull'
alias gpr='git pull --rebase'
alias gs='git status -s'
alias ga='git add '
alias gaa='git add .'
alias gb='git branch '
alias gc='git commit -m'
alias gd='git diff'
alias gp='git push'
alias go='git checkout '
alias cev='cd ~/Developer'
alias co='code .'
alias l='eza -l -b --icons=always -a --show-symlinks --group-directories-first --smart-group --no-permissions --no-user --no-time'
alias del='rm -rf'

if (( MACOS )); then
  alias studio='open -a "Android Studio"'
else
  alias studio="/opt/android-studio/android-studio/bin/studio &&"
fi

alias gtree='git log --all --decorate --oneline --graph'
alias ...='../..'
alias ....='../../..'
alias .....='../../../../'
alias ......='../../../../..'
alias relinknode='del /usr/local/bin/node && ln -s $(which node) /usr/local/bin'

# oh-my-posh prompt
# Sometimes this breaks so the config below is for a simple manual prompt
eval "$(oh-my-posh init zsh --config ~/.mytheme.omp.json)"

# setopt prompt_subst
# PROMPT_EOL_MARK=''
# PROMPT='%F{cyan}%n@%m%f %F{magenta}%~%f$(parse_git_branch) %(?.%F{green}➜%f.%F{red}✗%f) '
# RPROMPT='%F{yellow}%*%f'

[[ -s "$HOMEBREW_PREFIX/etc/grc.zsh" ]] && source $HOMEBREW_PREFIX/etc/grc.zsh

