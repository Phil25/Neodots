#!/bin/bash

set -e # exit on error

echo "Symlinking $HOME/.config/.xinitrc as $HOME/.xinitrc..."
ln -s ~/.config/.xinitrc ~/.xinitrc

echo "Symlinking Doom Emacs configuration directory..."
mkdir -p ~/.config/.doom.d
ln -s ~/.config/.doom.d ~/.doom.d

echo "Setting XDG_CONFIG_HOME as $HOME/.config..."
echo "export XDG_CONFIG_HOME=\"\$HOME/.config\"" >> ~/.profile

echo "Changing zsh dot directory to .config..."
echo "ZDOTDIR=~/.config" > ~/.zshenv

echo "Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo "Installing Vim plugins..."
nvim -es -i NONE -c "PlugInstall" -c "qa"

echo "Setting zsh as default shell... (requires password)"
chsh -s $(which zsh)
