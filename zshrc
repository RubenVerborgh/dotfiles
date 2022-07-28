# Initialize local settings
[ -f ~/.init ] && source ~/.init

# Load completion
zstyle ':completion:*:*:git:*' script $dotfiles/completion/bash/git-completion.bash
autoload -Uz compinit && compinit

# Load program configurations
for file in $dotfiles/config/*_config; do . $file; done
unset file
