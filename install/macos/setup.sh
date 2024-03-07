echo "-- Installing macOS tools"

if test ! "$(which brew)"; then
    echo "* Homebrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "* Homebrew is already installed"
    brew tap homebrew/bundle
    brew bundle --file "$(dirname $0)/Brewfile" --no-lock
fi

# Set default MySQL root password and auth type
if test ! "$(which mysql)"; then
    mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"
fi

# Create a work directories
mkdir $HOME/work

# macOS related settings
osascript -e 'tell application "System Preferences" to quit'
sudo -v
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
