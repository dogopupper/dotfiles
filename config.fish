
umask 022

# kubectl aliases

alias k="kubectl"
alias kg="k get"
alias kgall="kg po --all-namespaces"
alias kgallwide="kgall -o wide"
alias ka="k apply -f"
alias kd="k describe"
alias kdel="k delete"
alias cluster="k config use-context"
alias getclusters="k config get-clusters"
alias kssh="k exec -it"
alias ns="kubens"

export KUBECONFIG=$HOME/.kube/config

complete -f -c kubens -a "(kubectl get ns -o=custom-columns=NAME:.metadata.name --no-headers)"


# CD shortcuts

alias home="cd $HOME"
alias repo="home;cd repo"
alias work="repo;cd work"

alias pycharm="bash /etc/pycharm-2017.3.2/bin/pycharm.sh"

# go env
export GOROOT=/usr/local/go
export GOPATH=$HOME/goproj
set PATH $GOROOT/bin $GOPATH/bin $PATH


# extra aliases
alias yaml2js="python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"

alias fishconf="home;vim .config/fish/config.fish"


# git functions

alias g="git"
alias gs="g status"
alias gd="g diff"
alias gp="g pull"
alias check="g checkout"   
alias bran="g branch"

function gitdogo
    cp "~/.gitconfigdogo" "~/.gitconfig"
end

function gitwork
    cp "~/.gitconfigwork" "~/.gitconfig"
end

function gitpush
    git add *
    git commit -m $argv
    git push
end

function gitforce
    git add *
    git commit --amend --no-edit
    git push -f
end

function forksync
    git remote add upstream $argv
    git fetch upstream
    git merge upstream/master
end

alias gitsync="bass ls | parallel git -C {} pull"

function gitupdate # ??? alias is better
    for dir in * #(find . -maxdepth 1 -type d)
    echo "Entering $dir"
    cd $dir
    git pull
    cd -
    end
end

function gitdogo
    git config --global user.name "dogopupper"
    git config --global user.email "email"
end

function gitwork
     git config --global user.name "dogopupper"
     git config --global user.email "workemail"
end

function gitfun
    git add --all 
    git commit -m "(curl -s http://whatthecommit.com/index.txt)"
    git push
end

# X Server
export DISPLAY=0:0

# Fish
set -g theme_date_format "+%a %H:%M"
set -g theme_color_scheme terminal-dark-black

function fish_greeting
  set_color blue
  set splash (ls -d $HOME/.config/fish/splash/* | shuf -n 1)
  cat $splash
  uname -nmsr
  uptime
  home
  set_color normal
end


export DOCKER_HOST=tcp://0.0.0.0:2375
