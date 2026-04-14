use ~/.config/colors/colors.nu

print "return \{"
colors |
    transpose name value |
    each {|color| "    " + $color.name + " = \"" + $color.value + "\",\n"} |
    str join | print
print "\}"
