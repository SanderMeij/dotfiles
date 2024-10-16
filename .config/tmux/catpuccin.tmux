#!/bin/zsh

source-file ~/.config/colors/colors.sh

# set-option -gq "status" "on"
# set-option -gq "status-justify" "left"
#
set-option -gq "status-left-length" "100"
set-option -gq "status-right-length" "100"
# set-option -gq "status-right-attr" "none"
#
set-option -gq "message-fg" "$foreground"
set-option -gq "message-bg" "$background"
#
set-option -gq "message-command-fg" "$foreground"
set-option -gq "message-command-bg" "$background"

set-option message-style bg="$primary"
set-option message-style fg="$text"
#
# set-option -gq "status-attr" "none"
# set-option -gq "status-left-attr" "none"
#
# set-window-option -gq "window-status-fg" "$onedark_black"
# set-window-option -gq "window-status-bg" "$onedark_black"
# set-window-option -gq "window-status-attr" "none"
#
# set-window-option -gq "window-status-activity-bg" "$onedark_black"
# set-window-option -gq "window-status-activity-fg" "$onedark_black"
# set-window-option -gq "window-status-activity-attr" "none"
#
# set-window-option -gq "window-status-separator" ""
#
# set-option -gq "window-style" "fg=$onedark_comment_grey"
# set-option -gq "window-active-style" "fg=$onedark_white"
#
# set-option -gq "pane-border-fg" "$onedark_white"
# set-option -gq "pane-border-bg" "$onedark_black"
# set-option -gq "pane-active-border-fg" "$onedark_green"
# set-option -gq "pane-active-border-bg" "$onedark_black"
#
# set-option -gq "display-panes-active-colour" "$onedark_yellow"
# set-option -gq "display-panes-colour" "$onedark_blue"
#
set-option -gq "status-bg" "$background"
set-option -gq "status-fg" "$foreground"
#
# set-option -gq "@prefix_highlight_fg" "$onedark_black"
# set-option -gq "@prefix_highlight_bg" "$onedark_green"
# set-option -gq "@prefix_highlight_copy_mode_attr" "fg=$onedark_black,bg=$onedark_green"
# set-option -gq "@prefix_highlight_output_prefix" "  "
#
# time_format="%R"
# date_format="%d/%m/%Y"

background_primary="#{?client_prefix,#[bg=$active],#[bg=$primary]}#[fg=$base,bold]"
foreground_primary="#{?client_prefix,#[fg=$active],#[fg=$primary]}#[bg=$base,bold]"
background_secondary="#[fg=$base,bg=$secondary]"
foreground_secondary="#[fg=$secondary,bg=$background]"
background_gray="#[fg=$text,bg=$surface0]"
foreground_gray="#[fg=$surface0,bg=$background]"

# Left
set-option -gq "status-left" ""
set-window-option -g window-status-separator " "
set-option -gq "window-status-format" "${foreground_secondary}${background_secondary}#I #[fg=$secondary,bg=$surface0]${background_gray} #W ${foreground_gray}"
set-option -gq "window-status-current-format" "${foreground_primary}${background_primary}#I ${foreground_primary}#[bg=$surface0]${background_gray} #W ${foreground_gray}"

# Right
set-option -gq "status-right" "#(nu /Users/sander/.dotfiles/notifications.nu || echo 'failed!') ${foreground_gray} ${background_gray}#[italics] #(watson status -e)#[fg=$secondary,bg=$surface0, noitalics] ${background_secondary}  ${foreground_secondary} ${foreground_gray}${background_gray} #{s|+|$|:#{s|$HOME|~>|:#{session_path}}}${foreground_primary}#[bg=$surface0] ${background_primary}  ${foreground_primary}"
