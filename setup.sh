#!/bin/bash
# Base: Ubuntu24.04LST

# install
sudo apt install build-essential
sudo apt install tree
sudo apt install curl
sudo apt install net-tools
sudo apt-get install lib32stdc++6
sudo apt-get install openssh-server
sudo apt-get install neofetch
sudo apt install lcov
sudo apt-get install bear
sudo apt-get install tofrodos  # fromdos/todos

# remove
sudo apt-get remove libreoffice-common
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca gnome-sudoku

# cmake
sudo apt install cmake  # cmake --version
sudo apt-get install cmake-curses-gui  # ccmake --version

# git
sudo apt install git  # git --version
git config --global core.editor vi  # 修改git 默认编辑器
git config --global user.name XXXX  # 设置用户名
git config --global user.email xxxxxxxxx  # 设置邮箱
git config --global credential.helper store  # 长期存储密码

# zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install powerline
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# 修改~/.zshrc
# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(
#     git
#     z
#     zsh-syntax-highlighting
#     zsh-autosuggestions)
#
#重启终端配置powerlevel10k

# ctags
sudo apt-get install autoconf
sudo apt-get install ctags -y
# 设置全局git忽略
git config --global core.excludesfile ~/.gitignore_global
touch ~/.gitignore_global
echo ".tags" >> ~/.gitignore_global

# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
git clone git@github.com:KyleDeng/nvim.git
# 按照readme配置

# ranger
sudo apt-get install ranger
ranger --copy-config=all
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

# tmux
sudo apt install tmux -y
git clone https://github.com/KyleDeng/tmux.conf
cp ./tmux.conf/tmux.conf ~/.tmux.conf

# samba
sudo apt-get install samba
sudo apt-get install cifs-utils
sudo apt-get install samba-common
sudo mkdir -p /home/share
sudo chmod 777 -R /home/share
sudo vi /etc/samba/smb.conf
# [share]
#     path = /home/share/samba
#     available = yes
#     browseable = yes
#     public = no
#     writable = yes
sudo smbpasswd -a huatuo
sudo service smbd restart

# poetry
pip3 install poetry

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# docker


# go


# nodejs


