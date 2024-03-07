# golang vars
export GOPATH=$HOME/work/go
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE=github.com
export CGO_CFLAGS_ALLOW=-Xpreprocessor
export GOOS=darwin
export GOARCH=arm64

# personal aliases
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
alias c='clear'
alias q='exit'
alias vim='nvim'
alias cd='z'
alias useprune='export LC_CTYPE=C && export LANG=C'
alias nprune="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
# git
alias gprune='git fetch --prune && git branch -r | awk "{print \$1}" | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk "{print \$1}" | xargs git branch -D'
alias grsh='git reset --hard'
alias grsf='git checkout HEAD --'
alias gdel='git push origin --delete '
alias gst='git status'
alias ga='git add'
alias gcm='git commit -m'
# docker
alias kedit='kubectl edit deployment'
alias kexec='kubectl exec -it'
alias kgrep='kubectl get pods | grep'
alias kgrepdeploy='kubectl get deploy | grep'
alias ktail='kubectl logs -f --tail=20'
alias kreload='kubectl rollout restart deployment'
alias kpod='kubectl describe pod'
alias kdeploy='kubectl describe deploy'
# insync
alias insync_mysql='ssh -o ServerAliveInterval=3600 -o ServerAliveCountMax=10 -fN -L 3306:localhost:3306 insync-root'

# search for all listening ports
listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
        elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# kill specific port
killport() {
    lsof -ti:$1 | xargs kill -9
}
