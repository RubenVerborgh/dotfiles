# Find dotfiles base path, with the -f option for full path if necessary
if readlink -f ~/.bashrc > /dev/null 2>&1; then
  dotfiles=`dirname $(readlink -f ~/.bashrc)`
else
  dotfiles=`dirname $(readlink ~/.bashrc)`
fi

# Set up paths
export PATH=$dotfiles/bin:$PATH
[ -f ~/.paths ] && source ~/.paths
