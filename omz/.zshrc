# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions) # plugins

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# git
git_help(){
    cat << EOF
[git help menu]
gam = git add . && git commit
gcm = git commit -m
gpl = git pull
gps = git push
gco = git checkout
gbr = git branch
gst = git status
gdf = git diff
gdfc = git diff --cached
EOF
}
alias ghp="git_help"
alias gam="git add . && git commit"
alias gcm="git commit -m"
alias gpl="git pull"
alias gps="git push"
alias gco="git checkout"
alias gbr="git branch"
alias gst="git status"
alias gdf="git diff"
alias gdfc="git diff --cached"

# docker
docker_my_help(){
    cat << EOF
    [docker]
dh: docker help
dps: docker ps
dpsa: docker ps -a
dpsq: docker ps -q
dpsaq: docker ps -aq
dst: docker stats
ddel: docker rm -f
dlog: docker logs
dimg: docker images

dcu: docker-compose up -d
dcd: docker-compose down
dclog: docker-compose logs
dcb: docker-compose build
EOF
}
alias dhp="docker_my_help"
alias dh="docker --help"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dpsq="docker ps -q"
alias dpsaq="docker ps -aq"
alias dst="docker stats"
alias ddel="docker rm -f"
alias dlog="docker logs"
alias dimg="docker images"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dclog="docker-compose logs"
alias dcb="docker-compose build"

# systemctl
systemctl_help(){
    cat << EOF
[systemctl]
scts: systemctl status
sctr: systemctl restart
scts: systemctl start
sctp: systemctl stop
EOF
}
alias scth="systemctl_help"
alias scts="systemctl status"
alias sctr="systemctl restart"
alias scts="systemctl start"
alias sctp="systemctl stop"

# 常用脚本:
my_func_help(){
    cat << EOF
[files]
cfs: count files

[process]
scanp: scan port used by process
killp: kill process by port
killn: kill process by name

[misc]
rpwd: generate random password
EOF
}
alias mfhp="my_func_help"

# count_files: 统计当前目录下的文件数量, 可以使用正则表达式过滤
count_files() {
    local files_count=0
    local pattern="$1"
    if [ -z "$pattern" ]; then
        # 如果没有提供正则表达式，则统计所有文件
        files_count=$(ls -1 | wc -l)
    else
        # 如果提供了正则表达式，则使用它来过滤文件列表
        files_count=$(ls -1 | grep -E "$pattern" | wc -l)
    fi
    echo "Count of files: $files_count"
}
alias cfs=count_files

# scan_port: 检查端口是否被占用
scan_port() {
  if [ -z "$1" ]; then
    echo "usage: sport <port or range>"
    return 1
  fi

  local port_range=$1

  # 检查输入是否为单个端口
  if [[ $port_range =~ ^[0-9]+$ ]]; then
    netstat -tuln | grep -w "$port_range"
  # 检查输入是否为端口范围
  elif [[ $port_range =~ ^[0-9]+-[0-9]+$ ]]; then
    local start_port=${port_range%-*}
    local end_port=${port_range#*-}
    for ((port=start_port; port<=end_port; port++)); do
      netstat -tuln | grep -w "$port"
    done
  else
    echo "Error: Invalid port range format. Please provide a single port or a range like 80-443."
    return 1
  fi

  # 打印进程的PID、协议和状态
  local pid_protocol_state
  pid_protocol_state=$(netstat -tulnp | awk '/^tcp/ {print $7 " " $1 " " $6}')
  echo "$pid_protocol_state"
}
alias scanp=scan_port

# kill_process_by_port: 杀死指定端口的进程
kill_process_by_port() {
    if [ -z "$1" ]; then
        echo "usage: kilkp <port>"
        return 1
    fi

    # 查找给定端口的PID
    local pid
    pid=$(lsof -t -i:"$1")

    if [ -z "$pid" ]; then
        echo "No process found listening on port $1."
        return 1
    fi

    # 杀死相关的进程
    kill $pid

    local kill_result=$?
    if [ $kill_result -eq 0 ]; then
        echo "Process on port $1 has been terminated."
    else
        echo "Failed to terminate process on port $1. You might need to run as root."
    fi
}
alias kilkp=kil_process_by_port

# kill_process_by_name: 杀死指定名称的进程
kill_process_by_name() {
    if [ -z "$1" ]; then
        echo "usage: kilkn <process name>"
        return 1
    fi

    local process_name=$1
    local pids

    # Find the PIDs of the process name given
    pids=$(pgrep -f "$process_name")

    if [ -z "$pids" ]; then
        echo "No process found with name $process_name."
        return 1
    fi

    # Kill the processes with the PIDs found
    echo "Killing the following process(es): $pids"
    kill $pids

    local kill_result=$?
    if [ $kill_result -eq 0 ]; then
        echo "Process(es) named $process_name have been terminated."
    else
        echo "Failed to terminate process(es) named $process_name. You might need to run as root or check the process name."
    fi
}
alias killn=kill_process_by_name

# 生成随机密码
gen_random_password() {
    local length=$1
    if [ -z "$length" ]; then
        length=16
    fi

    local type=$2
    if [ -z "$type" ]; then
        type="h"
    fi
    
    # type=h: 生成16进制密码, b: 生成base64密码, 默认为hex
    if [ "$type" = "h" ]; then
        openssl rand -hex "$length"
        return 0
    elif [ "$type" = "b" ]; then
        openssl rand -base64 "$length"
        return 0
    else
        echo "Error: Invalid type. Please provide a valid type: h, b or n."
        return 1
    fi
}
alias rpwd=gen_random_password