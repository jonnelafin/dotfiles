#!/usr/bin/bash
echo "JF Dotfile setup v. 1.0"
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
