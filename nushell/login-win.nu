echo "load nolan's profile"
# git
def git-help-func [] {
    echo "git-help-func"
    echo "ga = git add ."
    echo "gc = git commit"
    echo "gcm = git commit -m"
    echo "gac = git add . ; git commit"
    echo "gam = git add . ; git commit --amend"
    echo "gamn = git add . ; git commit --amend --no-edit"
    echo "grm = git rm --cached"
    echo "gpl = git pull"
    echo "gps = git push"
    echo "gpf = git push --force"
    echo "gs = git status"
    echo "gl = git log"
    echo "gdf = git diff"
    echo "gdfc = git diff --cached"
}
alias ghf = git-help-func
# git aliases:
alias ga = git add .
alias gc = git commit
alias gcm = git commit -m
def gac-func [] {
    git add .
    git commit
}
alias gac = gac-func
def gam-func [] {
    git add .
    git commit
}
alias gam = gam-func
def gamn-func [] {
    git add .
    git commit --amend --no-edit
}
alias gamn = gamn-func
alias grm = git rm --cached
alias gpl = git pull
alias gps = git push
def git-push-force-func [] {
    echo "Are you sure you want to force push? (y/N): "
    let answer = (input)
    if $answer =~ "(?i)y" {
        git push --force
        return
    }
    echo "Aborted"
    return
}
alias gpf = git-push-force-func
alias gs = git status
alias gl = git log
alias gdf = git diff
alias gdfc = git diff --cached

# docker
def docker-help-func [] {
    echo "docker-help-func"
    echo "dh = docker --help"
    echo "dps = docker ps"
    echo "dpsa = docker ps -a"
    echo "dpsq = docker ps -q"
    echo "dpsaq = docker ps -aq"
    echo "dst = docker stats"
    echo "ddel = docker rm -f"
    echo "dlog = docker logs"
    echo "dimg = docker images"
    echo "dcu = docker-compose up -d"
    echo "dcd = docker-compose down"
    echo "dclog = docker-compose logs"
    echo "dcb = docker-compose build"
}
alias dhf = docker-help-func
# docker aliases:
alias dh = docker --help
alias dps = docker ps
alias dpsa = docker ps -a
alias dpsq = docker ps -q
alias dpsaq = docker ps -aq
alias dst = docker stats
alias ddel = docker rm -f
alias dlog = docker logs
alias dimg = docker images

alias dcu = docker-compose up -d
alias dcd = docker-compose down
alias dclog = docker-compose logs
alias dcb = docker-compose build

def misc-help-func [] {
    echo "misc-help-func"
    echo "csh = cd ~/.ssh"
    echo "cat = open"
    echo "sal = ssh-add -l"
    echo "sshTg = ssh -T"
    echo "sshTgv = ssh -Tv"
}
alias mhf = misc-help-func
# misc aliases:
# [misc]
alias csh  = cd ~/.ssh
alias cat = echo "cat is disabled, use open instead"

# [ssh]
alias sal = ssh-add -l
alias sshTg = ssh -T git@github.com
alias sshTgv = ssh -Tv git@github.com
