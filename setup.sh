#!/bin/sh

backupAndCreateLink() {
    local realDir=$1
    local thisDir=$2

    if [ -d $realDir ]; then
        echo "Found directory, backing it up $realDir -> $realDir.bak"
        mv $realDir $realDir.bak 
    fi

    if [ -f $realDir ]; then
        echo "Found file, backing it up $realDir -> $realDir.bak"
        mv $realDir $realDir.bak 
    fi

    absDir=$(pwd)$thisDir
    echo "Creating symlink $realDir -> $absDir"
    ln -s $absDir $realDir
}

configDir=$HOME/.config
backupAndCreateLink "$configDir/nvim" "/neovim"
backupAndCreateLink "$configDir/kitty" "/kitty"
backupAndCreateLink "$configDir/i3" "/i3"
backupAndCreateLink "$configDir/picom" "/picom"
backupAndCreateLink "$configDir/polybar" "/polybar"
backupAndCreateLink "$configDir/hypr" "/hyprland"
backupAndCreateLink "$configDir/ghostty" "/ghostty"
backupAndCreateLink "$configDir/swaync" "/swaync"
backupAndCreateLink "$configDir/wofi" "/wofi"
backupAndCreateLink "$HOME/.zshrc" "/zshrc/zshrc"
backupAndCreateLink "$HOME/.tmux.conf" "/tmux/tmux.conf"
backupAndCreateLink "$configDir/Code/User/settings.json" "/vscode/settings.json"
backupAndCreateLink "$configDir/Code/User/keybindings.json" "/vscode/keybindings.json"

