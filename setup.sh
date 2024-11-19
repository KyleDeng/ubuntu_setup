#!/bin/bash
# Base: Ubuntu24.04LST

# install
sudo apt install build-essential
sudo apt-get install clangd
sudo apt install tree
sudo apt install curl
sudo apt install net-tools
sudo apt-get install lib32stdc++6
sudo apt-get install openssh-server
sudo apt-get install neofetch
sudo apt install lcov
sudo apt-get install bear
sudo apt-get install tofrodos  # fromdos/todos
sudo apt install python3-pip  # sudo mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/EXTERNALLY-MANAGED.bak
echo "export PATH=$PATH:~/.local/bin/" >> ~/.zshrc

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

# 安装Hack字体
# 搜索图形 https://www.nerdfonts.com/cheat-sheet
# 带补丁 https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/Bold
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
unzip ./Hack.zip
mkdir -p ~/.local/share/fonts
cp ./Hack*.ttf -t ~/.local/share/fonts
fc-cache -f -v
# 重启终端 选择Hack Nerd Font字体

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

# fzf
sudo apt-get install fzf
# vim ~/.zshrc
# FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --border --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
# export FZF_COMPLETION_TRIGGER='\'
# export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'


# ctags
sudo apt-get install autoconf
sudo apt-get install universal-ctags  # sudo apt-get install ctags -y
# 设置全局git忽略
git config --global core.excludesfile ~/.gitignore_global
touch ~/.gitignore_global
echo ".tags" >> ~/.gitignore_global

# neovim lazyvim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
# 打开一次nvim 等待插件安装完成
rm -rf ~/.config/nvim
git clone https://github.com/KyleDeng/nvim.git ~/.config/nvim
# 按照readme配置

# ranger
sudo apt-get install ranger
ranger --copy-config=all
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
echo "
# ranger
alias ra=\"ranger\"
" >> ~/.zshrc

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

# go


# nodejs
sudo apt-get install npm
sudo npm install --global yarn

