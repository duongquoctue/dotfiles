echo "-- Installing shared tools"

if ! [ -d ~/.oh-my-zsh ]; then
    echo "* oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "* oh-my-zsh is already installed"
fi

cfg="$(pwd)/config"

# zsh
rm -rf "$HOME/.zprofile"
rm -rf "$HOME/.zshrc"
rm -rf "$HOME/.p10k.zsh"
ln -sf "$cfg/zsh/.zprofile" "$HOME/.zprofile"
ln -sf "$cfg/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$cfg/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

# git
rm -rf "$HOME/.gitconfig"
rm -rf "$HOME/.gitignore_global"
ln -sf "$cfg/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$cfg/git/.gitignore_global" "$HOME/.gitignore_global"

# nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.config/nvim
ln -sf "$cfg/nvim" ~/.config/nvim

# kitty
rm -rf ~/.config/kitty
ln -sf "$cfg/kitty" ~/.config/kitty
