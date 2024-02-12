setopt PROMPT_SUBST

function symbol () {
    test -f bin/console && echo '' || echo '󰅂'
}

function path () {
    session_path="$(tmux display-message -p '#{session_path}')"
    if [[ $PWD == $session_path* ]]; then
        result="%(?.%F{4}.%F{1})%F{0}%(?.%K{4}.%K{1})$(echo $session_path | sed "s#$HOME#~#")"
        if [[ $PWD == $session_path ]]; then
            result="$result%k%(?.%F{4}.%F{1}) "
        else
            result="$result%K{8}%(?.%F{4}.%F{1})%f$(echo $PWD | sed "s#$session_path/##")%k%F{8}"
        fi
    else
        result="%F{3}%F{0}%K{3}$(echo $PWD | sed "s#$HOME#~#")%k%F{3} "
    fi
    echo $result | sed "s#/##g";
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats " %b"
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

export PROMPT=' %F{7}$(path) %(?.%F{2}.%F{1})%f%k'
export RPROMPT='%F{4}${vcs_info_msg_0_}'
