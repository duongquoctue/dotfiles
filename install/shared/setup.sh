echo "-- Installing shared tools"

cfg="$(pwd)/config"

# zsh
rm -rf "$HOME/.zprofile"
rm -rf "$HOME/.zshrc"
ln -sf "$cfg/zsh/.zshrc" "$HOME/.zshrc"

# git
rm -rf "$HOME/.gitconfig"
rm -rf "$HOME/.gitignore_global"
ln -sf "$cfg/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$cfg/git/.gitignore_global" "$HOME/.gitignore_global"

# oh my posh
rm -rf ~/.config/ohmyposh
ln -sf "$cfg/ohmyposh" ~/.config/ohmyposh

# zellij
rm -rf ~/.config/zellij
ln -sf "$cfg/zellij" ~/.config/zellij

# ghostty
rm -rf ~/.config/ghostty
ln -sf "$cfg/ghostty" ~/.config/ghostty