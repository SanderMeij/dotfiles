autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats " %b"
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

# Prompt like  ~/dir 󰊍 ..  master 
export PROMPT=' %F{4} %F{7}%B%~%b %(?.%F{2}.%F{1})󰅂  %F{7}'
export RPROMPT='%F{4}${vcs_info_msg_0_}'

