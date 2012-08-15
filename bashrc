# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Find dotfiles base path
bashrc=`readlink ~/.bashrc`
dotfiles=`dirname $bashrc`

# Set up paths
export PATH=$dotfiles/bin:$PATH
if [ -f ~/.paths ]; then
  source ~/.paths
fi

# Load individual program configuration
for configFile in $dotfiles/config/programs/*_config; do
  . $configFile
done

# Set up individual program completion
for completionFile in $dotfiles/config/completion/*_completion; do
  . $completionFile
done
