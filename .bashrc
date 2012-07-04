#PATHを通します
if [ `uname` = "Darwin" ]; then
    export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
    export MANPATH=/opt/local/man:$MANPATH
    export PATH=/usr/local/bin:$PATH

    #EDITORの設定
    export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vi'
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "&$@"'
fi

#コマンドの設定
export HISTCONTROL=ignoreboth
alias ls='ls -GFh'
alias emacs='emacs -nw'
alias less='less -M'
#export PS1='\u@\[\033[1;31m\]\H\[\033[0m\][\W]\$ '
#export CLICOLOR=1

#MAMPの設定達
#export PATH=/Applications/MAMP/bin/php/php5.3.6/bin:$PATH
alias mmysql="/Applications/MAMP/Library/bin/mysql"
alias mphp="/Applications/MAMP/bin/php/php5.3.6/bin/php"
alias mpear="/Applications/MAMP/bin/php/php5.3.6/bin/pear"
alias phperror="tail /Applications/MAMP/logs/php_error.log"
alias apacheerror="tail /Applicatons/MAMP/logs/apache_error.log"
alias mysqlerror="tail /Applications/MAMP/logs/mysql_error_log.err"

# 履歴のサイズ。
HISTSIZE=50000
HISTFILESIZE=50000

#bashの補完機能を向上
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

#bashプロンプトの色設定とgitのブランチを表示
if [ -f $BASH_COMPLETION_DIR/git ]; then
    export PS1='\[\033[01;31m\]\u@\h\[\033[01;36m\] \w$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] '
elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    export PS1='\[\033[01;31m\]\u@\h\[\033[01;36m\] \w$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;36m\] \w \[\033[01;34m\]\$\[\033[00m\] '
fi

