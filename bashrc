# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Find dotfiles base path
if readlink -f ~/.bashrc > /dev/null 2>&1; then
  # If readlink supports the -f option, we need it to obtain the full path.
  bashrc=`readlink -f ~/.bashrc`
else
  # If -f is not supported, readlink returns the full path anyway.
  bashrc=`readlink ~/.bashrc`
fi
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
