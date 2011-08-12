if [ ! -n "${BIN+x}" ]; then
  export BIN=~/Library/bin
fi

. $BIN/dotfiles/bash/env
. $BIN/dotfiles/bash/config
. $BIN/dotfiles/bash/aliases

for f in $BIN/dotfiles/bash/program_config/*_config; do
  source $f;
done

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

for f in $BIN/dotfiles/bash/completion/*_completion; do
  source $f;
done
