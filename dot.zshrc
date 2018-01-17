# =============================================================================
#                                 TOP
# =============================================================================
export TERM="xterm-256color"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"


# =============================================================================
#                                   Alias
# =============================================================================
alias sl=ls
alias cask="brew cask"
alias pc="proxychains4 -q"
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias pyclear="find . -name '*.pyc' -delete"


# =============================================================================
#                                   Variables
# =============================================================================
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:$PATH"
export GOPATH="$(go env GOPATH)"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:`yarn global bin`"

# export python by brew installed python
if [[ $OSTYPE = (darwin)* ]]; then
	export PATH="/usr/local/opt/python/libexec/bin:$PATH"
fi

# export python on linux
if [[ $OSTYPE = (linux)* ]]; then
	export PATH="/usr/bin/python:$PATH"
fi

# virtualenvwrapper config
VIRTUALENVWRAPPER_PYTHON="$(which python)"
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh


# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

zplug "lib/*", from:oh-my-zsh, defer:0

zplug "plugins/git",               from:oh-my-zsh, if:"which git"
zplug "plugins/go",                from:oh-my-zsh, if:"which go"
zplug "plugins/golang",            from:oh-my-zsh, if:"which go"
zplug "plugins/taskwarrior",       from:oh-my-zsh, if:"which task"
zplug "plugins/lein",              from:oh-my-zsh, if:"which lein"
zplug "plugins/pip",               from:oh-my-zsh, if:"which pip"
zplug "plugins/virtualenvwrapper", from:oh-my-zsh, if:"which workon"
zplug "plugins/virtualenv",        from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/z",                 from:oh-my-zsh

zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-bd"
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"


# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
	zplug "plugins/archlinux", from:oh-my-zsh, if:"which pacman"
fi

if [[ $OSTYPE = (darwin)* ]]; then
	zplug "plugins/osx", from:oh-my-zsh
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Check initial directory for any .venv file
# this function provided by "MichaelAquilina/zsh-autoswitch-virtualenv"
check_venv
