# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

HIST_STAMPS="dd/mm/yyyy"
plugins=(zsh-autosuggestions)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# using homebrew if exists
eval "$(/opt/homebrew/bin/brew shellenv)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="nvim"
else
    export EDITOR="nvim"
fi

export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[green]%} ??? %~%{$reset_color%}$(git_prompt_info) '
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fix issues with GPG signing
export GPG_TTY=$(tty)

# using volta if exists
if [ -x "$(command -v volta)" ]; then
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
fi

# using deno if exists
if [ -x "$(command -v deno)" ]; then
    export DENO_INSTALL="/Users/dqt/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi

# using pyenv if exists
if [ -x "$(command -v pyenv)" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# using zoxide if exists
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi
