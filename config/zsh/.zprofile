# using homebrew if exists
eval "$(/opt/homebrew/bin/brew shellenv)"

# fix issues with GPG signing
export GPG_TTY=$(tty)

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
