autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

compdef _symfony_complete symfony
compdef _symfony_complete composer
compdef _symfony_complete console
