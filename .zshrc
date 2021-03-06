export LANG=ja_JP.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:$PATH
####
#default till here
####


#alias for applications
alias chrome="open -a Google\ Chrome"
alias slack="open -a Slack"
alias sl="slack"
alias coda="open -a Coda\ 2"
alias xcode="open -a Xcode "
alias finder="open -a Finder"
alias preview="open -a Preview"
alias monitor="open -a Activity\ Monitor"
alias atom="open -a Atom"
alias lsl="ls -l"
alias lsa="ls -a"

alias m="mongo"
alias gpo="git push origin"

alias p="python"
alias conf="less ~/.ssh/config"
alias t="tmux"
alias sl="ls"

alias g="git"
alias sss='python ~/workspace/pysacloud/show_server.py -t'


#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#export PYTHONSTARTUP=~/.pythonstartup
#export PYTHONDONTWRITEBYTECODE=1

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper
#workon default

# doxygen path
export PATH=/Applications/Doxygen.app/Contents/Resources:$PATH
###########
## z
##########
 . `brew --prefix`/etc/profile.d/z.sh


###################
# ssh-terminal
##################

ssh_tmux() {
    ssh_cmd="ssh $@"
    tmux new-window -n "$*" "$ssh_cmd"
}

if [ $TERM = "screen" ] ; then
    tmux lsw
    if [ $? -eq 0 ] ; then
        alias ssh=ssh_tmux
    fi
fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# emacs_cmd() {
#     if ps aux | grep Emacs  | grep -v grep > /dev/null
#     then
#         echo "emacs Running"
#         emacsclient $@
#     else
#         echo "start emacs"
#         open -a /usr/local/Cellar/emacs/HEAD/Emacs.app
#     fi

# }
alias emd="\emacs --daemon"
alias emc="emacsclient"
alias ekill="emacsclient -e '(progn (defun yes-or-no-p (p) t) (kill-emacs))'"
alias emacs_="/usr/local/bin/emacs"
alias emacs="emc"
alias e="emc"
alias emcas="emacs"

export ANSIBLE_COW_SELECTION=random

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# setting for peco
#for f (~/.zsh/peco-sources/*) source "${f}" # load peco sources
#bindkey '^r' peco-select-history
#bindkey '^@' peco-cdr


export GOPATH=~/.go
export PATH=$HOME/.go/bin:$PATH

export GISTY_ACCESS_TOKEN=c632351081a6cd2fcc14ff14be320deb52b972e8
export GISTY_DIR=$HOME/gists

function peco-select-gitadd() {
    local selected_file_to_add=$(git status --porcelain | \
                                                            peco --query "$LBUFFER" | \
                                                            awk -F ' ' '{print $NF}')
    if [ -n "$selected_file_to_add" ]; then
        BUFFER="git add ${selected_file_to_add}"
        CURSOR=$#BUFFER
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-select-gitadd
bindkey "^g^a" peco-select-gitadd

function peco-select-git-branch-delete() {
    local selected_branch_to_delete=$(git branch | \
                                                     peco --query "$LBUFFER" | \
                                                     awk -F ' ' '{print $NF}')
    if [ -n "$selected_branch_to_delete" ]; then
        BUFFER="git branch -d ${selected_branch_to_delete}"
        CURSOR=$#BUFFER
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-select-git-branch-delete
bindkey "^g^b^b" peco-select-git-branch-delete

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 |\
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-select-ssh() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | grep 'ssh ' | sort | uniq |\
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-ssh
bindkey '^s' peco-select-ssh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH


export PATH=$PATH:/Users/kawasakitoshiya/.nodebrew/current/bin
export PATH="$HOME/.rbenv/bin:$PATH"

# The next line enables shell command completion for gcloud.
export PATH=$HOME/.nodebrew/current/bin:$PATH
export LANG=en_US

alias git=hub
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $HOME/.cargo/env

export PYTHONDONTWRITEBYTECODE=1

export PATH=$HOME/.pyenv/bin:$PATH
alias gt='git'
alias igt='git'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
