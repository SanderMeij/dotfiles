#!/bin/bash

get_volume() {
  pamixer --get-volume
}

get_mute() {
  pamixer --get-mute
}

main() {
  vol=$(get_volume)
  mute=$(get_mute)

  echo "{\"volume\": $vol, \"muted\": $mute}"
}

main
