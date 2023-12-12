# 安装 zsh
sudo apt-get install zsh -y
# 设置 zsh 为默认 shell, 需求输入密码, 所以注释掉
# echo "setting zsh as default shell ..."
# chsh -ls /bin/zsh

# 安装 oh-my-zsh, 并且 输入 Y
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh is already installed."
    echo "if you want to reinstall it, please enter Y."

    read -r -p "Do you want to reinstall oh-my-zsh? [Y/n] " answer
    if [ -z "$answer" ] || [ "$answer" != "${answer#[Yy]}" ]; then
        echo "reinstalling oh-my-zsh ..."
        rm -rf ~/.oh-my-zsh
        rm -rf ~/.zshrc
        # next step
    else
        echo "exiting ..."
        exit 0
    fi
fi

echo "installing oh-my-zsh ... if it takes too long, you can press Ctrl+C to stop it."
echo "Y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh 插件
# syntax-highlighting 高亮
# check if zsh-syntax-highlighting is installed
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo "installing zsh-syntax-highlighting ... if it takes too long, you can press Ctrl+C to stop it."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

# completions 自动补全
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
    echo "installing zsh-completions ... if it takes too long, you can press Ctrl+C to stop it."
    git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
fi

# autosuggestions 自动建议
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "installing zsh-autosuggestions ... if it takes too long, you can press Ctrl+C to stop it."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi


# 从仓库中获取配置文件
echo "downloading .zshrc ... if it takes too long, you can press Ctrl+C to stop it."
URL="https://raw.githubusercontent.com/KuJyoAi/MyLinux/master/omz/.zshrc"
curl -o ~/.zshrc-pre $URL
mv ~/.zshrc ~/.zshrc-bak
mv ~/.zshrc-pre ~/.zshrc

# 设置 zsh 为默认 shell
echo "need to set zsh as default shell, and switch to zsh? [Y/n]"
read -r answer
if [ -z "$answer" ] || [ "$answer" != "${answer#[Yy]}" ]; then
    echo "setting zsh as default shell ..."
    chsh -s /bin/zsh
    zsh
    else
    exit 0
fi

