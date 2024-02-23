#!/bin/zsh

onedark_black="#1e2024"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#8cb371"
onedark_visual_grey="#393e48"
onedark_comment_grey="#5c6370"

set-option -gq "status" "on"
set-option -gq "status-justify" "left"

set-option -gq "status-left-length" "100"
set-option -gq "status-right-length" "100"
set-option -gq "status-right-attr" "none"

set-option -gq "message-fg" "$onedark_white"
set-option -gq "message-bg" "$onedark_black"

set-option -gq "message-command-fg" "$onedark_white"
set-option -gq "message-command-bg" "$onedark_black"

set-option -gq "status-attr" "none"
set-option -gq "status-left-attr" "none"

set-window-option -gq "window-status-fg" "$onedark_black"
set-window-option -gq "window-status-bg" "$onedark_black"
set-window-option -gq "window-status-attr" "none"

set-option -gq "popup-border-style" "fg=white bg=black"

set-window-option -gq "window-status-activity-bg" "$onedark_black"
set-window-option -gq "window-status-activity-fg" "$onedark_black"
set-window-option -gq "window-status-activity-attr" "none"

set-window-option -gq "window-status-separator" ""

set-option -gq "window-style" "fg=$onedark_white"
set-option -gq "window-active-style" ""

set-option -gq "pane-border-fg" "$onedark_white"
set-option -gq "pane-border-bg" "$onedark_black"
set-option -gq "pane-active-border-fg" "$onedark_blue"
set-option -gq "pane-active-border-bg" "$onedark_black"

set-option -gq "display-panes-active-colour" "$onedark_yellow"
set-option -gq "display-panes-colour" "$onedark_blue"

set-option -gq "status-bg" "$onedark_black"
set-option -gq "status-fg" "$onedark_white"

set-option -gq "@prefix_highlight_fg" "$onedark_black"
set-option -gq "@prefix_highlight_bg" "$onedark_green"
set-option -gq "@prefix_highlight_copy_mode_attr" "fg=$onedark_black,bg=$onedark_green"
set-option -gq "@prefix_highlight_output_prefix" "  "

time_format="%R"
date_format="%d/%m/%Y"
background_primary="#{?client_prefix,#[bg=$onedark_green],#[bg=$onedark_blue]}#[fg=$onedark_black,bold]"
background_gray="#[fg=$onedark_white,bg=$onedark_visual_grey,bold]"

set-option -gq "status-left" "$background_primary #S #{prefix_highlight}"

set-option -gq "window-status-format" " 󰓪 #W "
set-option -gq "window-status-current-format" "$background_gray #{?window_zoomed_flag,󰍋,󰓩} #W "

set-option -gq "status-right" "#[bg=$onedark_visual_grey]   #(watson status -e) $background_primary  #{s|/||:#{s|$HOME|~|:#{session_path}}} "
