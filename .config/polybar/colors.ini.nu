use ~/.config/colors/colors.nu
print "[colors]"
colors |
    transpose name value |
    each {|color| ($color.name + " = " + $color.value)} |
    str join "\n"
