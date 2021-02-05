#!/usr/bin/bash
echo "JF Dotfile setup v. 1.0"
echo "installing dependencies..."
#
which dnf && { sudo dnf install zsh -y;}
which zypper && { echo "I have no idea how to install zsh on opensuse";}
which apt-get && { sudo apt-get install zsh -y;}
#
echo "making backups to $HOME/.jfBackup"
jf_user=$(whoami)
if [ ! -f "$HOME/.jfBackup" ]; then
	mkdir ~/.jfBackup
fi
if [ -f "$HOME/.zshrc" ]; then
	mv ~/.zshrc ~/.jfBackup/.zshrc
fi
if [ -f "$HOME/.zshrc" ]; then
	mv ~/.oh-my-zsh ~/.jfBackup/.oh-my-zsh
fi
echo "Copying zsh dotfiles and oh-my-zsh installation..."
cd zsh
cp -r ./ ~/
cd ..
echo "Setting default shell to zsh..."
chsh -s $(which zsh)
echo "All done, have a good day!"
