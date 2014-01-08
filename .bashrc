# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[[ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]] && \
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash

git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}

export PS1="\e[0;33m\W \t \$ \e[0m"
export PS1='\[\033[40;0;33m\]\W hailong-mac/ \[\033[40;2;37m\]\t\[\033[0m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\] $ '
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS=DxGxcxdxCxegedabagacad

# Perl
export PERL_CPANM_OPT="--local-lib=~/perl5"
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;

# Path
export PATH=$HOME/bin:$PATH;

# User specific aliases and functions
alias composer="php /usr/bin/composer.phar"
alias ls='ls  -F -G'
alias la='ls -a'
alias ll='ls -l'
