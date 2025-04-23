use ~/.config/colors/colors.nu

colors |
    transpose name value |
    each {|color| ("set -gq @" + $color.name + " \"" + $color.value + "\"")} |
    str join "\n"
