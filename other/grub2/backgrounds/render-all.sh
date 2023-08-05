#! /usr/bin/env bash

set -e

RESOLUTIONS=("1080p" "2k" "4k")

for resolution in "${RESOLUTIONS[@]}"; do
  echo "./render-core.sh \"$resolution\": "
  if [[ $# -eq 1 && "$1" = "clean" ]]; then 
  ./render-core.sh "$resolution" "clean"
  else
  ./render-core.sh "$resolution"
  fi
done

exit 0
