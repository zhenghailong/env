env
===

# fzf

use Homebrew to install fzf.

```
brew install fzf
$(brew --prefix)/opt/fzf/install
```

# zshrc
use chsh command change login shell to zsh and copy zshrc file to home directory.

```
cp zshrc ~/.zshrc
cp fzf.zsh ~/.fzf.zsh
. ~/.zshrc
```

# vim

use Homebrew to install vim and copy vimrc file to home directory to install vim plugin.

```
brew install vim
cp vimrc ~/.vimrc
```

install vim plugin.

```
vi ~/.vimrc
# command mode でPlugInstallコマンド実行
```

# git

copy gitconfig to home directory.

```
cp gitconfig ~/.gitconfig
```


