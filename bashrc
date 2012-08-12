# Find dotfiles base path
bashrc=`readlink ~/.bashrc`
dotfiles=`dirname $bashrc`

# Set up bash
. $dotfiles/bash/env
. $dotfiles/bash/config
. $dotfiles/bash/aliases

# Set up programs
for configFile in $dotfiles/bash/program_config/*_config; do
  . $configFile;
done

# Set up completion
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
for completionFile in $dotfiles/bash/completion/*_completion; do
  . $completionFile
done
