# ssh-add
ssh-add /Users/hailong.zheng/.ssh/id_rsa_classi

# color
export TERM=xterm-256color

# 日本語を使用
export LANG=ja_JP.UTF-8

# PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$PATH:/Users/hailong.zheng/Library/Android/sdk/platform-tools
export PATH="$HOME/.rbenv/bin:$PATH" 

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH=$PATH:/Users/hailong.zheng/.nodebrew/current/bin

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# 色を使用
autoload -Uz colors
colors

# 補完
#autoload -Uz compinit
#compinit -i
autoload -U compinit && compinit
zmodload -i zsh/complist

# emacsキーバインド
bindkey -e

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'

# エイリアス
alias ls='ls -G'
alias la='ls -la -G'
alias ll='ls -l -G'
alias so='source'
alias v='vim'
alias vi='/usr/local/Cellar/vim/8.1.0202/bin/vim'
alias vim='/usr/local/Cellar/vim/8.1.0202/bin/vim'
alias vz='vim ~/.zshrc'
alias c='cdr'
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'
alias ag='ag --color'

# backspace,deleteキーを使えるように
#stty erase ^H
#bindkey "^[[3~" delete-char
# cdの後にlsを実行
chpwd() { ls -G }

# どこからでも参照できるディレクトリパス
cdpath=(~)

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./;@"
zstyle ':zle:*' word-style unspecified

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# プロンプトを2行で表示、時刻を表示
#PROMPT="%(?.%{${fg[white]}%}.%{${fg[white]}%})%n${reset_color}@${fg[white]}%m ${reset_color}%*%  %~
PROMPT="%{${fg[white]}%}%n@%m${reset_color}${fg[blue]} %*% ${reset_color}${fg[yellow]} %~ %{${reset_color}%}
%# "

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
if [ -n "$LS_COLORS" ]; then
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# # Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
# bindkey '^r' history-incremental-pattern-search-backward
# bindkey '^s' history-incremental-pattern-search-forward

# # コマンドを途中まで入力後、historyから絞り込み
# # 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
# autoload -Uz history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^p" history-beginning-search-backward-end
# bindkey "^b" history-beginning-search-forward-end

# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# # cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# 複数ファイルのmv 例　zmv *.txt *.txt.bk
autoload -Uz zmv
alias zmv='noglob zmv -W'

# mkdirとcdを同時実行
function mkcd() {
if [[ -d $1 ]]; then
	echo "$1 already exists!"
	cd $1
else
	mkdir -p $1 && cd $1
fi
}

RPROMPT="%{${fg[blue]}%}%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b]'
precmd () { vcs_info }
precmd_functions+=( precmd )
RPROMPT=$RPROMPT'%F{green}${vcs_info_msg_0_}%f'
# peco + aws-select-hosts
function peco-select-hosts () {
STAGE=$1
# ls-hostsへのパスは適宜読み替えてください
# ↓awk で生成するSSHコマンドをprivate IP指定に書き換えました
BUFFER=$(
/Users/hailong.zheng/bin/ls-hosts -N -stage $STAGE | \
	sort -k 5 | \
	peco --prompt "AWS::$STAGE >" --query "$LBUFFER" | \
	awk '{printf "echo \">>> Log into %s<<<\"; ssh %s\n",$5,$3}'
)
CURSOR=$#BUFFER
zle accept-line
zle clear-screen
}
function peco-select-hosts-staging() { peco-select-hosts staging }
function peco-select-hosts-production() { peco-select-hosts production }
function peco-select-hosts-development() { peco-select-hosts development }
# バインドキーはおこのみで...
zle -N peco-select-hosts-staging
bindkey '^oo' peco-select-hosts-staging
zle -N peco-select-hosts-production
bindkey '^o0' peco-select-hosts-production
zle -N peco-select-hosts-development
bindkey '^od' peco-select-hosts-development

# ssh-agentで鍵をもっていく
ssh-add -l 2>&1 > /dev/null
if [ $? -ne 0 ]; then
	ssh-add ~/.ssh/id_rsa_classi # 自分の秘密鍵のパスを指定
fi

function staging-branch-from-circleci() {
target=`echo $(ghq list | peco) | awk -F / '{ printf "%s/%s",$2,$3 }'`
  curl -s https://circleci.com/api/v1.1/project/github/$target\?circle-token\=$CIRCLECI_API_TOKEN\&filter\=successful\&limit\=100 | jq ".[] | .branch" | grep deployment/staging | head -n 1
}
alias ss='staging-branch-from-circleci'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --inline-info --border'
export FZF_DEFAULT_COMMAND='ag -g ""'
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history


eval "$(rbenv init - zsh)"
