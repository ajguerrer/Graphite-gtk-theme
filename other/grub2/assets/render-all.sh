#! /usr/bin/env bash

set -e

THEMES=("logos" "assets")
COLORS=("" "-stonerose")
RESOLUTIONS=("1080p" "2k" "4k")

for theme in "${THEMES[@]}"; do
  for color in "${COLORS[@]}"; do
    for resolution in "${RESOLUTIONS[@]}"; do
      echo "./render-core.sh \"$theme\" \"$color\" \"$resolution\": "
      if [[ $# -eq 1 && "$1" = "clean" ]]; then 
        ./render-core.sh "$theme" "$color" "$resolution" "clean"
      else
        ./render-core.sh "$theme" "$color" "$resolution"
      fi
    done
  done
done

exit 0
