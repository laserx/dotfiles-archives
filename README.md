# dotfile repo

## dot.zshrc
1. 安装 zsh: `brew install zsh`
1. 配置 zsh 为默认 sh: `chsh -s $(which zsh)`
1. 安装字体, 使用 brew 需要 tap caskroom/fonts: `brew tap caskroom/fonts; brew cask install font-sourcecodepro-nerd-font`
1. git clone repo: `git clone https://github.com/laserx/dotfile.git .dotfile`
1. 安装 zplug: `curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh`
1. 创建链接: `ln -s ~/.dotfile/dot.zshrc ~/.zshrc`
1. 开启一个新的 `iterm2` 的会话, 确认安装插件