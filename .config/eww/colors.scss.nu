use ~/.config/colors/colors.nu
colors |
    transpose name value |
    each {|color| ("$" + $color.name + ": " + $color.value + ";")} |
    str join "\n"
