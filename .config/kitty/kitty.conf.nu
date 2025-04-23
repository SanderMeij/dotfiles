use ~/.config/colors/colors.nu

let colors = colors

let values = {
    font_size: 12,
    font_family     : "Jetbrains Mono Medium",
    bold_font       : "Jetbrains Mono Bold",
    italic_font     : "Cascadia Mono Italic",
    bold_italic_font: "Cascadia Mono Bold Italic",
    enable_audio_bell: "no",
    shell: "nu",
    confirm_os_window_close: 0,
    # background_image: "~/background.png",
    # background_image_layout: "scaled",
    # background_tint: 0.995,
    foreground: $colors.foreground,
    background: $colors.gray1,
    color0: $colors.black,
    color8: $colors.black,
    color1: $colors.red,
    color9: $colors.red,
    color2: $colors.green,
    color10: $colors.green,
    color3 : $colors.yellow,
    color11: $colors.yellow,
    color4 : $colors.blue,
    color12: $colors.blue,
    color5 : $colors.magenta,
    color13: $colors.magenta,
    color6 : $colors.cyan,
    color14: $colors.cyan,
    color7 : $colors.white,
    color15: $colors.white,
}

let mappings = {
     "ctrl+v": "paste_from_clipboard"
}

$values |
    transpose key value |
    each {|row| $row.key + " " + ($row.value | into string) + "\n"} |
    str join | print

$mappings |
    transpose key value |
    each {|row| "map " + $row.key + " " + $row.value + "\n"} |
    str join | print
