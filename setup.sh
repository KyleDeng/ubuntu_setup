#!/bin/bash
# Base: Ubuntu24.04LST

# update
sudo apt-get update
sudo apt-get upgrade
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa  # 关闭云枢
sudo apt-get update
sudo apt install pipx  # 打开云枢
sudo ln -s /usr/bin/pipx /usr/bin/pip
sudo apt install python3-venv
# 重启一次

# install
sudo apt install build-essential -y
sudo apt-get install clangd -y
sudo apt install tree -y
sudo apt install curl -y
sudo apt install net-tools -y
sudo apt-get install lib32stdc++6 -y
sudo apt-get install openssh-server -y
sudo apt-get install neofetch -y
sudo apt install lcov -y
sudo apt-get install bear -y
sudo apt-get install tofrodos -y  # fromdos/todos
sudo apt install python3-pip -y  # sudo mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/EXTERNALLY-MANAGED.bak
# 重启一次

# nodejs
sudo apt-get install npm -y
sudo npm install --global yarn

# remove
sudo apt-get remove libreoffice-common
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca gnome-sudoku

# cmake
sudo apt install cmake  # cmake --version
sudo apt-get install cmake-curses-gui  # ccmake --version

# git
sudo apt install git  # git --version
git config --global core.editor vi  # 默认编辑器
git config --global user.name XXXX
git config --global user.email xxxxxxxxx
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
sudo apt-get install autoconf -y
sudo apt-get install universal-ctags  # sudo apt-get install ctags -y
# 设置全局git忽略
git config --global core.excludesfile ~/.gitignore_global
touch ~/.gitignore_global
echo ".tags" >> ~/.gitignore_global

# neovim lazyvim
# sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get update
sudo apt-get install neovim -y
git clone https://github.com/LazyVim/starter ~/.config/nvim
# 打开一次nvim 等待插件安装完成
rm -rf ~/.config/nvim
git clone https://github.com/KyleDeng/nvim.git -b v095 ~/.config/nvim
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
sudo apt-get install samba -y
sudo apt-get install cifs-utils -y
sudo apt-get install samba-common -y
sudo mkdir -p /home/share
sudo chmod 777 -R /home/share
sudo vi /etc/samba/smb.conf
# [share]
#     path = /home/share
#     available = yes
#     browseable = yes
#     public = no
#     writable = yes
sudo smbpasswd -a huatuo
sudo service smbd restart

# 输入法 搜狗
https://pinyin.sogou.com/linux/help.php
sudo apt-get install fcitx
打开 系统设置——区域和语言——管理已安装的语言——在“语言”tab下——点击“添加或删除语言”
弹出“已安装语言”窗口，勾选中文（简体），点击应用
回到“语言支持”窗口，在键盘输入法系统中，选择“fcitx”
sudo dpkg -i sogoupinyin_版本号_amd64.deb

# poetry
pip3 install poetry

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# go




