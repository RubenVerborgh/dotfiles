#### PATHS ####

# Find dotfiles base path
bashrc=`readlink ~/.bashrc`
dotfiles=`dirname $bashrc`

# Set up paths
export PATH=$dotfiles/bin:$PATH
if [ -f ~/.paths ]; then
  source ~/.paths
fi

#### BASH ####

# Make bash history ignore duplicates, ls, ll, and commands starting with spaces
export HISTIGNORE="&:l[sl]:[ ]*"

# fix forward-search-history (C-s) - http://nathanpowell.org/blog/archives/632
stty stop undef

# Informative prompt with git repository info
PS1='\[\e[1;36m\]\h:\[\e[m\]\[\e[0;32m\]\W\[\e[m\]\[\e[0;31m\]$(__git_ps1)\[\e[m\]$ '

# Create a t function that opens a new tab with the current directory
function t {
	osascript -e "
		tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
		tell application \"Terminal\" to do script \"clear;cd \\\"$(PWD)\\\";clear\" in selected tab of the front window
	" > /dev/null 2>&1
}

#### PROGRAMS ####

# Load individual program configuration
for configFile in $dotfiles/bash/program_config/*_config; do
  . $configFile
done

# Set up bash completion
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
# Set up individual program completion
for completionFile in $dotfiles/bash/completion/*_completion; do
  . $completionFile
done

# Set vim as default editor
export EDITOR=vim
