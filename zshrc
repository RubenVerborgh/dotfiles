# Set up paths
export PATH=$dotfiles/bin:$PATH
[ -f ~/.paths ] && source ~/.paths

# Load completion
zstyle ':completion:*:*:git:*' script $dotfiles/completion/bash/git-completion.bash
autoload -Uz compinit && compinit

# Load program configurations
for file in $dotfiles/config/*_config; do . $file; done
unset file
