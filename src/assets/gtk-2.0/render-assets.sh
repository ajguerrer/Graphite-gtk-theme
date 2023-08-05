#! /usr/bin/env bash

set -e

RENDER_SVG="$(command -v resvg)" || true
INKSCAPE="$(command -v inkscape)" || true
OPTIPNG="$(command -v optipng)" || true

INDEX_COMMON="assets-common.txt"
INDEX_THEME="assets-theme.txt"

for color in '' '-Dark'; do
  for type in '' '-nord'; do
    ASSETS_DIR="assets-common${color}${type}"
    [[ -d $ASSETS_DIR ]] && rm -rf $ASSETS_DIR
  done
done

for theme in '' '-purple' '-pink' '-red' '-orange' '-yellow' '-green' '-teal' '-blue'; do
  for color in '' '-Dark'; do
    for type in '' '-nord'; do
      ASSETS_DIR="assets${theme}${color}${type}"
      SRC_FILE="assets${theme}${color}${type}.svg"
      [[ -d $ASSETS_DIR ]] && rm -rf $ASSETS_DIR
    done
  done
done

if [[ $# -eq 1 && "$1" = "clean" ]]; then 
  exit
fi

for color in '' '-Dark'; do
  for type in '' '-nord'; do
    ASSETS_DIR="assets-common${color}${type}"
    SRC_FILE="assets-common${color}${type}.svg"

    mkdir -p $ASSETS_DIR

    for i in `cat $INDEX_COMMON`; do
      if [[ -f "$ASSETS_DIR/$i.png" ]]; then
        echo "'$ASSETS_DIR/$i.png' exists."
      else
        echo "Rendering '$ASSETS_DIR/$i.png'"
        if [[ -n "${RENDER_SVG}" ]]; then
          "$RENDER_SVG" --export-id "$i" \
                        "$SRC_FILE" "$ASSETS_DIR/$i.png"
        else
          "$INKSCAPE" --export-id="$i" \
                      --export-id-only \
                      --export-filename="$ASSETS_DIR/$i.png" "$SRC_FILE" >/dev/null
        fi
        if [[ -n "${OPTIPNG}" ]]; then
          "$OPTIPNG" -o7 --quiet "$ASSETS_DIR/$i.png"
        fi
      fi
    done
  done
done

for theme in '' '-purple' '-pink' '-red' '-orange' '-yellow' '-green' '-teal' '-blue'; do
  for color in '' '-Dark'; do
    for type in '' '-nord'; do
      ASSETS_DIR="assets${theme}${color}${type}"
      SRC_FILE="assets${theme}${color}${type}.svg"

      mkdir -p $ASSETS_DIR

      for i in `cat $INDEX_THEME`; do
        if [[ -f "$ASSETS_DIR/$i.png" ]]; then
          echo "'$ASSETS_DIR/$i.png' exists."
        else
          echo "Rendering '$ASSETS_DIR/$i.png'"
          if [[ -n "${RENDER_SVG}" ]]; then
            "$RENDER_SVG" --export-id "$i" \
                          "$SRC_FILE" "$ASSETS_DIR/$i.png"
          else
            "$INKSCAPE" --export-id="$i" \
                        --export-id-only \
                        --export-filename="$ASSETS_DIR/$i.png" "$SRC_FILE" >/dev/null
          fi
          if [[ -n "${OPTIPNG}" ]]; then
            "$OPTIPNG" -o7 --quiet "$ASSETS_DIR/$i.png"
          fi
        fi
      done
    done
  done
done

echo -e "DONE!"
