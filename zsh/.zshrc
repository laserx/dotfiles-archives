# =============================================================================
#                                 TOP
# =============================================================================
export TERM="xterm-256color"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="vim"

if [[ $OSTYPE = (linux)* ]]; then
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
fi

# =============================================================================
#                                   Alias
# =============================================================================
alias sl=ls
alias cask="brew cask"
alias pc="proxychains4 -q"
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias pyclear="find . -name '*.pyc' -delete"
alias screenfetch="screenfetch -E"
alias hp="all_proxy=127.0.0.1:1087 "


# =============================================================================
#                                   Variables
# =============================================================================
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:$PATH"
export GOPATH="$(go env GOPATH)"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/.mix"
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"

# =============================================================================
#                                     Tpm
# =============================================================================

[ ! -d ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# =============================================================================
#                                   vim-plug
# =============================================================================

# Check vim-plug for vim is installed
[ ! -f ~/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ] && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
export ZPLUG_HOME=~/.zplug
source ~/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

zplug "lib/*", from:oh-my-zsh, defer:0

zplug "plugins/git",               from:oh-my-zsh, if:"which git"
zplug "plugins/go",                from:oh-my-zsh, if:"which go"
zplug "plugins/golang",            from:oh-my-zsh, if:"which go"
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

# zplug self-manage enabled
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Supports oh-my-zsh plugins and the like
if [[ $OSTYPE = (linux)* ]]; then
    zplug "plugins/archlinux", from:oh-my-zsh, if:"which pacman"
    export PATH="/usr/bin/python:$PATH"
    source /bin/virtualenvwrapper.sh
fi

if [[ $OSTYPE = (darwin)* ]]; then
    zplug "plugins/osx", from:oh-my-zsh
    export PATH="/usr/local/opt/python/libexec/bin:$PATH"
    source /usr/local/bin/virtualenvwrapper.sh
fi

# virtualenvwrapper config
VIRTUALENVWRAPPER_PYTHON="$(which python)"
export WORKON_HOME=~/Envs

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

# Direnv hook
eval "$(direnv hook zsh)"

