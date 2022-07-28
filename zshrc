# Initialize local settings
[ -f ~/.init ] && source ~/.init

# Set up autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:*:git:*' script $dotfiles/completion/bash/git-completion.bash

# Load program configurations
for file in $dotfiles/config/*_config; do . $file; done
unset file
