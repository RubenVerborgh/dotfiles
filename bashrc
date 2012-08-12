# Find dotfiles base path
bashrc=`readlink ~/.bashrc`
dotfiles=`dirname $bashrc`

# Set up bash
. $dotfiles/bash/env
. $dotfiles/bash/config
. $dotfiles/bash/aliases

# Set up programs
for f in $dotfiles/bash/program_config/*_config; do
  source $f;
done

# Set up completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
for f in $dotfiles/bash/completion/*_completion; do
  source $f;
done
