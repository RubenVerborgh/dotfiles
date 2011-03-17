# my bin path
export BIN=~/Library/bin
export PATH=$BIN:$PATH

# vim
export EDITOR=$BIN/vim

# ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
alias ls='ls -h'
alias ll='ls -lG'

# fix forward-search-history (C-s) - http://nathanpowell.org/blog/archives/632
stty stop undef

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
alias portclean='du -sh /opt; sudo port clean --all installed; sudo port -f uninstall inactive; du -sh /opt'

# Dynamic linker path
export DYLD_FALLBACK_LIBRARY_PATH=/opt/local/lib/:$DYLD_FALLBACK_LIBRARY_PATH

# NuPIC
NTA=$HOME/Documents/UGent/Tools/nupic/current
export PATH=$NTA/bin:$PATH
export PYTHONPATH=$NTA/lib/python2.5/site-packages:$PYTHONPATH
export VERSIONER_PYTHON_PREFER_32_BIT=yes

# My Tools
export PATH=~/Library/Tools/:$PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# newtab command
function t {
	osascript -e "
		tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
		tell application \"Terminal\" to do script \"clear;cd \\\"$(PWD)\\\";clear\" in selected tab of the front window
	" > /dev/null 2>&1
}

# git
source ~/.git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
alias gitgc='du -hs .git;git gc --aggressive --prune;du -hs .git'
# enable mouse scrolling with less
# https://bugs.launchpad.net/ubuntu/+source/git-core/+bug/326460
export LESS=R

# prompt
PS1='\[\e[1;36m\]\h:\[\e[m\]\[\e[0;32m\]\W\[\e[m\]\[\e[0;31m\]$(__git_ps1)\[\e[m\]$ '
