# fix issues with GPG signing
export GPG_TTY=$(tty)

# using homebrew if exists
if [ -x "$(command -v deno)" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# using deno if exists
if [ -x "$(command -v deno)" ]; then
    # TODO
fi

# using pyenv if exists
if [ -x "$(command -v pyenv)" ]; then
    # TODO
fi

# using zoxide if exists
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi

if [ -x "$(command -v oh-my-posh)" ]; then
    eval "$(oh-my-posh init zsh)"
fi
