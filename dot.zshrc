#Boot `POWERLEVEL9K_INSTALLATION_PATH` at begin
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "

POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="249"

POWERLEVEL9K_TODO_BACKGROUND="black"
POWERLEVEL9K_TODO_FOREGROUND="249"

POWERLEVEL9K_DIR_HOME_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_FOREGROUND="249"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="249"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="249"

POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

POWERLEVEL9K_NVM_BACKGROUND="black"
POWERLEVEL9K_NVM_FOREGROUND="249"
POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_COLOR="green"

POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"

POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="249"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

POWERLEVEL9K_BATTERY_LOW_BACKGROUND="black"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="black"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="black"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="black"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="249"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="249"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="249"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="249"
POWERLEVEL9K_BATTERY_LOW_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_BATTERY_CHARGING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_BATTERY_CHARGED_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_BATTERY_DISCONNECTED_VISUAL_IDENTIFIER_COLOR="249"

POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uf017}"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv command_execution_time load ram time)
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\uf113"


# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

zplug "lib/*", from:oh-my-zsh, defer:0

zplug "plugins/git",               from:oh-my-zsh, if:"which git"
zplug "plugins/go",                from:oh-my-zsh, if:"which go"
zplug "plugins/golang",            from:oh-my-zsh, if:"which go"
zplug "plugins/taskwarrior",       from:oh-my-zsh, if:"which task"
zplug "plugins/lein",              from:oh-my-zsh, if:"which lein"
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/z",                 from:oh-my-zsh
zplug "plugins/pip",               from:oh-my-zsh

zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

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
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GOPATH="$(go env GOPATH)"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$PATH:`yarn global bin`"

# virtualenvwrapper config
VIRTUALENVWRAPPER_PYTHON="/usr/local/opt/python/libexec/bin/python"
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

