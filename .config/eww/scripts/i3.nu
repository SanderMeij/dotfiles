#!/snap/bin/nu

def find-windows [] {
    if $in.window_type == 'normal' {
        $in.window_properties.class
    } else {
        $in | get nodes | each {|node| $node | find-windows } | str join " | "
    }
}

i3-msg -t get_tree | from json
| get nodes | where name == "DP-3-1" | first | find-windows | to json
# | get nodes | each {|workspace | $workspace
#     | get nodes | each {|window|
#         try { $window.window_properties.class }
#     }
#     | str join " " }
# | str join "|"
