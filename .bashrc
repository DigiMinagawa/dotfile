export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
export HISTCONTROL=ignoreboth
alias ls='ls -Fh'
alias emacs='emacs -nw'
alias less='less -M'
alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "&$@"'

# :export PATH=$PATH:/usr/local/bin:
export HISTCONTROL=ignoreboth
alias ls='ls -GFh'
alias emacs='emacs -nw'
alias less='less -M'
export PS1='\u@\[\033[1;31m\]\H\[\033[0m\][\W]\$ '
#export CLICOLOR=1

alias ti='/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.2/iphone/builder.py'


export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH

export PATH=/Applications/MAMP/bin/php/php5.3.6/bin:$PATH
alias phperror="tail /Applications/MAMP/logs/php_error.log"
alias apacheerror="tail /Applicatons/MAMP/logs/apache_error.log"
alias mysqlerror="tail /Applications/MAMP/logs/mysql_error_log.err"

# 履歴のサイズ。新山の場合はこれで半年ぐらい前のやつまで残る。
HISTSIZE=50000
HISTFILESIZE=50000

#bashの補完機能を向上
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

#bashプロンプトの色設定とgitのブランチを表示
if [ -f $BASH_COMPLETION_DIR/git ]; then
    export PS1='\[\033[01;31m\]\u@\h\[\033[01;36m\] \w$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;36m\] \w \[\033[01;34m\]\$\[\033[00m\] '
fi
