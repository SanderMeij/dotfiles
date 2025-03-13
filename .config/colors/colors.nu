export def main [] {
    let hues = {
        green: "#90B99F",
        cyan: "#85B5BA",
        blue: "#92A2D5",
        violet: "#ACA1CF",
        magenta: "#E29ECA",
        red: "#EA83A5",
        orange: "#F5A191",
        yellow: "#E6B99D",
    }
    let hues = ($hues | merge {
        primary: $hues.blue,
        secondary: $hues.yellow,
        active: $hues.green,
        pink: $hues.magenta,
        aqua: $hues.cyan,
        purple: $hues.violet,
        brown: $hues.orange,
    })

    let grays = {
        black: "#131314",
        gray0: "#18181A",
        gray1: "#1B1B1C",
        gray2: "#2A2A2C",
        gray3: "#313134",
        gray4: "#3B3B3E",
        gray5: "#444448",
        gray6: "#6C6874",
        gray7: "#8B8693",
        gray8: "#9F9CA6",
        gray9: "#B4B1BA",
        white: "#C9C7CD",
    }
    let $grays = ($grays | merge {
        foreground: $grays.white,
        background: $grays.black,
        bg0: $grays.gray0,
        bg1: $grays.gray1,
        bg2: $grays.gray2,
        bg3: $grays.gray3,
        grey: $grays.gray6,
    })

    let colors = $hues | merge $grays
    let colors = ($colors | merge (
        $hues |
            transpose name value |
            each {|color| {
                name: ("dimmed_" + $color.name),
                value: (
                    pastel color $color.value | pastel mix $colors.gray1 | pastel format hex
                )
            }} |
            transpose --ignore-titles -r -d
    ))

    return $colors
}
