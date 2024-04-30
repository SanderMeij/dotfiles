#!/usr/bin/env nu

def main [initial: string] {
    yabai -m query --windows | from json | where display == 2 | each {|window| switch $initial $window}
}

def switch [ initial, window ] {
    if ($window.app == "kitty" and $initial == "k") {
        yabai -m window $window.id --focus
    } else if ($window.app == "Opera") {
        if ($window.title =~ "DevTools") {
            if ($initial == "d") {
                yabai -m window $window.id --focus
            }
        } else if ($initial == "o") {
            yabai -m window $window.id --focus
        }
    }
}
