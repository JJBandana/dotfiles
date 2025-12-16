#!/bin/bash

DIR="$HOME/Pictures"
mkdir -p "$DIR"

FILE="$DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

case "$1" in
area)
  grim -g "$(slurp)" "$FILE"
  ;;
full)
  grim "$FILE"
  ;;
*)
  notify-send "Screenshot" "Modo inválido. Usa: area | full"
  exit 1
  ;;
esac

wl-copy <"$FILE"
notify-send "📸 Screenshot" "Screenshot took and copied to clipboard: $FILE"
