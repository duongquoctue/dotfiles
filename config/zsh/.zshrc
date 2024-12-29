# fix issues with GPG signing
export GPG_TTY
GPG_TTY=$(tty)

# using homebrew if exists
eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# using zoxide if exists
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi

if [ -x "$(command -v oh-my-posh)" ]; then
    eval "$(oh-my-posh init zsh --config "$HOME/.config/ohmyposh/theme.json")"
fi

# history stuff
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS

export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "

# golang vars
export GOPATH=$HOME/work/go
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE=github.com,gitlab.com
export CGO_CFLAGS_ALLOW=-Xpreprocessor
export GOOS=darwin
export GOARCH=arm64

# personal aliases
alias c='clear'
alias ls='eza'
alias l='eza'
alias q='exit'
alias cd='z'
alias useprune='export LC_CTYPE=C && export LANG=C'
alias nprune="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
# git
function gprune() {
    git fetch --prune && git branch -r | awk '{print $1}' | grep -E -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}
alias grsh='git reset --hard'
alias grsf='git checkout HEAD --'
alias gdel='git push origin --delete '
alias gst='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gip='goimports -local "gradehub" -w $(find . -type f -name "*.go")'
# kubectl
alias k='kubectl'
alias kedit='kubectl edit deployment'
alias kexec='kubectl exec -it'
alias kgrep='kubectl get pods | grep'
alias kgrepdeploy='kubectl get deploy | grep'
alias ktail='kubectl logs -f --tail=20'
alias kreload='kubectl rollout restart deployment'
alias kpod='kubectl describe pod'
alias kdeploy='kubectl describe deploy'

# search for all listening ports
listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
        elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color "$1"
    else
        echo "Usage: listening [pattern]"
    fi
}

# kill specific port
killport() {
    lsof -ti:"$1" | xargs kill -9
}

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone --depth=1 https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Ensure zinit.zsh exists before sourcing
if [[ -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    zinit light-mode for \
        zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions
fi