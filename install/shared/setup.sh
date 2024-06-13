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

# kitty
rm -rf ~/.config/kitty
ln -sf "$cfg/kitty" ~/.config/kitty

# oh my posh
rm -rf ~/.config/ohmyposh
ln -sf "$cfg/ohmyposh" ~/.config/ohmyposh
