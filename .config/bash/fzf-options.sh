source ~/.config/colors/colors.sh

export FZF_DEFAULT_OPTS="
    --border=rounded
    --color=bg:-1,bg+:-1,fg:-1,hl:$yellow,fg+:$green,hl+:$yellow,info:$blue,prompt:$green,pointer:$green,marker:$blue,spinner:$blue,preview-fg:$blue
    --height=10
    --info=inline-right
    --no-scrollbar
    --pointer=''
    --preview-window=down,1,border-none
    --prompt=' '
    --reverse
    --bind='ctrl-j:pos(1)+accept'
    --bind='ctrl-k:pos(2)+accept'
    --bind='ctrl-l:pos(3)+accept'
"
