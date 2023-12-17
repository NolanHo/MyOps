# Description: install oh-my-zsh and plugins

# 检查是否安装了 zsh
if [ ! -x "$(command -v zsh)" ]; then
    echo "zsh not found, please install zsh first."
    exit 1
fi

# 检查是不是ubuntu 或者 debian
if [ ! -x "$(command -v apt-get)" ]; then
    echo "only support ubuntu or debian."
    exit 1
fi

echo "installing oh-my-zsh plugins ... if it takes too long, you can press Ctrl+C to stop it."

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

