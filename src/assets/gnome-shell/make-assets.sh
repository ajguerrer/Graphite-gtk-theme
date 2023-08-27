#! /usr/bin/env bash

set -e

RENDER_SVG="$(command -v resvg)" || true
INKSCAPE="$(command -v inkscape)" || true
OPTIPNG="$(command -v optipng)" || true

for theme in '' '-purple' '-pink' '-red' '-orange' '-yellow' '-green' '-teal' '-blue'; do
  for type in '' '-stonerose'; do
    if [[ "$type" != '' ]]; then
      rm -rf "theme${theme}${type}"
    elif [[ "$theme" != '' ]]; then
      rm -rf "theme${theme}"
    fi
  done
done
for color in '-Light' '-Dark'; do
  for type in '' '-stonerose'; do
    rm -f "background${color}${type}.png"
  done
done

if [[ $# -eq 1 && "$1" = "clean" ]]; then 
  exit
fi

for theme in '' '-purple' '-pink' '-red' '-orange' '-yellow' '-green' '-teal' '-blue'; do
  for type in '' '-stonerose'; do
    case "$theme" in
      '')
        theme_color_dark='#333333'
        theme_color_light='#e0e0e0'
        ;;
      -purple)
        theme_color_dark='#AB47BC'
        theme_color_light='#BA68C8'
        ;;
      -pink)
        theme_color_dark='#EC407A'
        theme_color_light='#F06292'
        ;;
      -red)
        theme_color_dark='#E53935'
        theme_color_light='#F44336'
        ;;
      -orange)
        theme_color_dark='#F57C00'
        theme_color_light='#FB8C00'
        ;;
      -yellow)
        theme_color_dark='#FBC02D'
        theme_color_light='#FFD600'
        ;;
      -green)
        theme_color_dark='#4CAF50'
        theme_color_light='#66BB6A'
        ;;
      -teal)
        theme_color_dark='#009688'
        theme_color_light='#4DB6AC'
        ;;
      -blue)
        theme_color_dark='#1A73E8'
        theme_color_light='#3281EA'
        ;;
    esac

    if [[ "$type" == '-stonerose' ]]; then
      case "$theme" in
        '')
          theme_color_dark='#B4B4BF'
          theme_color_light='#B4B4BF'
          ;;
        -purple)
          theme_color_dark='#AE9DBF'
          theme_color_light='#AE9DBF'
          ;;
        -pink)
          theme_color_dark='#BF9BAE'
          theme_color_light='#BF9BAE'
          ;;
        -red)
          theme_color_dark='#BF9D9D'
          theme_color_light='#BF9D9D'
          ;;
        -orange)
          theme_color_dark='#BFAE9D'
          theme_color_light='#BFAE9D'
          ;;
        -yellow)
          theme_color_dark='#BFAE9D'
          theme_color_light='#BFAE9D'
          ;;
        -green)
          theme_color_dark='#AEBF9D'
          theme_color_light='#AEBF9D'
          ;;
        -teal)
          theme_color_dark='#9DBFAE'
          theme_color_light='#9DBFAE'
          ;;
        -blue)
          theme_color_dark='#9DAEBF'
          theme_color_light='#9DAEBF'
          ;;
      esac
    fi

    if [[ "$type" != '' ]]; then
      rm -rf "theme${theme}${type}"
      cp -rf "theme" "theme${theme}${type}"
      sed -i "s/#333333/${theme_color_dark}/g" "theme${theme}${type}"/*.svg
      sed -i "s/#e0e0e0/${theme_color_light}/g" "theme${theme}${type}"/*.svg
      sed -i "s/#2c2c2c/#303033/g" "theme${theme}"/*.svg
    elif [[ "$theme" != '' ]]; then
      rm -rf "theme${theme}"
      cp -rf "theme" "theme${theme}"
      sed -i "s/#333333/${theme_color_dark}/g" "theme${theme}"/*.svg
      sed -i "s/#e0e0e0/${theme_color_light}/g" "theme${theme}"/*.svg
      
    fi
  done
done

for color in '-Light' '-Dark'; do
  for type in '' '-stonerose'; do
    echo "Rendering 'background pictures ...'"

    if [[ -n "${RENDER_SVG}" ]]; then
      "$RENDER_SVG" --export-id "background${color}${type}" \
                    --dpi 192 \
                    --zoom 2 \
                    background.svg "background${color}${type}.png"
    else
      "$INKSCAPE" --export-id="background${color}${type}" \
                  --export-id-only \
                  --export-dpi=192 \
                  --export-filename="background${color}${type}.png" background.svg >/dev/null
    fi
    if [[ -n "${OPTIPNG}" ]]; then
      "$OPTIPNG" -o7 --quiet "background${color}${type}.png"
    fi
  done
done

echo -e "DONE!"
