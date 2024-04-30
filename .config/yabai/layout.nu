#!/usr/bin/env nu

def main [layout: number] {
    yabai -m query --windows | from json | where display == 2 | each {|window| layout $layout $window}
}

def save_window_mapping [ id, mapping ] {
    echo $"yabai -m window ($id) --focus" | save $"~/.config/skhd/($mapping)" --force
}

def layout [ layout, window ] {
    if ($layout == 1) {
        yabai -m window $window.id --grid 1:1:1:1:1:1
    } else if ($layout == 2) {
        if ($window.app == "kitty") {
            yabai -m window $window.id --grid 1:12:4:1:5:1
            save_window_mapping $window.id k
        } else if ($window.app == "Opera") {
            if ($window.title =~ "DevTools") {
                yabai -m window $window.id --grid 1:12:9:1:3:1
                save_window_mapping $window.id l
            } else {
                yabai -m window $window.id --grid 1:12:0:1:4:1
                save_window_mapping $window.id j
            }
        } else {
            yabai -m window $window.id --grid 1:12:4:1:5:1
        }
    } else if ($layout == 3) {
        yabai -m window $window.id --grid 1:12:3:1:6:1
    }
}
