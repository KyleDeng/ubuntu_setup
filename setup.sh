#!/bin/bash
# Base: Ubuntu24.04LST

# 更换软件源
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo vim /etc/apt/sources.list
"
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
"

# update
sudo apt-get update
sudo apt-get upgrade
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa  # 关闭云枢
sudo apt-get update
sudo apt install pipx -y  # 打开云枢
sudo ln -s /usr/bin/pipx /usr/bin/pip
sudo apt install python3-pip -y  # sudo mv /usr/lib/python3.12/EXTERNALLY-MANAGED /usr/lib/python3.12/EXTERNALLY-MANAGED.bak
sudo apt install python3-venv
sudo apt install python3.8-venv
# export PATH=$PATH:$HOME/.local/bin/
# 重启一次

# install
sudo apt install build-essential -y
sudo apt-get install libsystemd-dev -y
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
sudo apt-get install vim -y
sudo apt install xclip -y
sudo apt-get install ripgrep -y
sudo apt install fd-find -y
sudo apt install python3.8 -y
sudo apt-get install ninja-build -y
sudo apt install cmake -y  # cmake --version
sudo apt-get install cmake-curses-gui  # ccmake --version
# 重启一次

# nodejs
sudo apt-get install npm -y
sudo npm install --global yarn

# remove
sudo apt-get remove libreoffice-common
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese transmission-common gnome-orca gnome-sudoku


# git
sudo apt install git  # git --version
git config --global core.editor vi  # 默认编辑器
git config --global user.name XXXX
git config --global user.email xxxxxxxxx
git config --global credential.helper store  # 长期存储密码

# 安装Hack字体
# 搜索图形 https://www.nerdfonts.com/cheat-sheet
# 带补丁 https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/Bold
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
# unzip ./Hack.zip
mkdir -p ~/.local/share/fonts  
git clone https://github.com/KyleDeng/ubuntu_setup.git --depth=1
cp ./Hack*.ttf -t ~/.local/share/fonts
fc-cache -f -v
# 重启终端 选择Hack Nerd Font字体

# zsh
sudo apt-get install -y zsh          
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install powerline -y
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
"
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --border --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_COMPLETION_TRIGGER='\'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
"


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
git clone https://github.com/KyleDeng/nvim.git ~/.config/nvim  # git@github.com:KyleDeng/nvim.git
# 按照readme配置
cd ~/.local/share/nvim/lazy/coc.nvim
yarn install
yarn build

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
"
[share]
    path = /home/share
    available = yes
    browseable = yes
    public = no
    writable = yes
"
sudo smbpasswd -a huatuo
sudo service smbd restart

# 输入法
# 1. 打开系统设置（ “Settings”）。
# 2. 选择地区和语言（“Region & Language”）。
# 3. 点击“Manage Installed Languages”。
# 4. 点击“Install/Remove Languages”勾选Chinese，可以同时勾选简体中文和繁体中文。
# 5. 点击“Apply Changes”。这需要管理员权限，你需要输入密码或请求的管理员账户的密码。
# 6. 中文正在被安装，相应的中文输入法也会一并被安装。安装完成后，你需要先退出登录，重新登录后新的语言选项才会被加载。
# 7. 重新登录后，再次打开系统设置（“Settings”）。
# 8. 选择 “Keyboard”。
# 9. 在 “Input Sources”下，点击 “+” 号来添加新的输入法。
# 10. 点击“Chinese”，并选择 “Chinese (Intelligent Pinyin)”。
# 11. 点击“Add”，智能拼音输入法就被成功加入到输入法之中了。

# 输入法 搜狗
https://pinyin.sogou.com/linux/help.php
sudo apt-get install fcitx
# 打开 系统设置——区域和语言——管理已安装的语言——在“语言”tab下——点击“添加或删除语言”
# 弹出“已安装语言”窗口，勾选中文（简体），点击应用
# 回到“语言支持”窗口，在键盘输入法系统中，选择“fcitx”
sudo cp /usr/share/applications/fcitx.desktop /etc/xdg/autostart/  # fcitx开机自启动
sudo apt purge ibus  # 删除ibus框架
sudo dpkg -i sogoupinyin_版本号_amd64.deb  # 安装搜狗
sudo apt install libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2  # 安装依赖
sudo apt install libgsettings-qt1
# 重启

# poetry
pip3 install poetry

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# python2
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
tar xzf Python-2.7.18.tgz
cd Python-2.7.18
sudo ./configure --enable-optimizations
sudo make altinstall
python2.7 -V
which python2.7
sudo ln -s /usr/local/bin/python2.7 /usr/local/bin/python2

# go

# 删除snap
snap remove --purge firefox
snap remove --purge snap-store
snap remove --purge gnome-42-2204
snap remove --purge gtk-common-themes
snap remove --purge snapd-desktop-integration
snap remove --purge bare
snap remove --purge firmware-updater
snap remove --purge canonical-livepatch
snap remove --purge core22
snap remove --purge snapd

sudo apt remove --autoremove snapd -y
cat /etc/apt/preferences.d/nosnap.pref
"
# To prevent repository packages from triggering the installation of snap,
# this file forbids snapd from being installed by APT.

Package: snapd
Pin: release a=*
Pin-Priority: -10
"
sudo apt update
rm -rf ~/snap/
sudo rm -rf /snap/
sudo rm -rf /var/cache/snapd/
sudo rm -rf /var/lib/snapd/

# clean
sudo apt autoclean
sudo apt clean
sudo apt autoremove




