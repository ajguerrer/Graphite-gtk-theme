#! /usr/bin/env bash

set -e

for theme in '' '-purple' '-pink' '-red' '-orange' '-yellow' '-green' '-teal' '-blue'; do
for color in '' '-Dark'; do
for type in '' '-stonerose'; do
  if [[ "$type" == '-stonerose' ]]; then
    rm -f "assets${theme}${color}${type}.svg"
  fi
  if [[ "$theme" != '' ]]; then
    rm -f "assets${theme}${color}.svg"
  fi
done
done
done
if [[ $# -eq 1 && "$1" = "clean" ]]; then 
  exit
fi

for theme in '' '-purple' '-pink' '-red' '-orange' '-yellow' '-green' '-teal' '-blue'; do
for color in '' '-Dark'; do
for type in '' '-stonerose'; do
  if [[ "$color" == '' ]]; then
    case "$theme" in
      -purple)
        theme_color='#AB47BC'
        ;;
      -pink)
        theme_color='#EC407A'
        ;;
      -red)
        theme_color='#E53935'
        ;;
      -orange)
        theme_color='#F57C00'
        ;;
      -yellow)
        theme_color='#FBC02D'
        ;;
      -green)
        theme_color='#4CAF50'
        ;;
      -teal)
        theme_color='#009688'
        ;;
      -blue)
        theme_color='#3684dd'
        ;;
    esac
  else
    case "$theme" in
      -purple)
        theme_color='#BA68C8'
        ;;
      -pink)
        theme_color='#F06292'
        ;;
      -red)
        theme_color='#F44336'
        ;;
      -orange)
        theme_color='#FB8C00'
        ;;
      -yellow)
        theme_color='#FFD600'
        ;;
      -green)
        theme_color='#66BB6A'
        ;;
      -teal)
        theme_color='#4DB6AC'
        ;;
      -blue)
        theme_color='#5294e2'
        ;;
    esac
  fi

  if [[ "$type" == '-stonerose' ]]; then
    case "$theme" in
      -purple)
        theme_color='#AE9DBF'
        ;;
      -pink)
        theme_color='#BF9BAE'
        ;;
      -red)
        theme_color='#BF9D9D'
        ;;
      -orange)
        theme_color='#BFAE9D'
        ;;
      -yellow)
        theme_color='#BFAE9D'
        ;;
      -green)
        theme_color='#AEBF9D'
        ;;
      -teal)
        theme_color='#9DBFAE'
        ;;
      -blue)
        theme_color='#9DAEBF'
        ;;
      *)
        if [[ "$color" == '' ]]; then
          theme_color='#B4B4BF'
        else
          theme_color='#B4B4BF'
        fi
        ;;
    esac
  fi

  if [[ "$type" == '-stonerose' ]]; then
    cp -rf "assets${color}.svg" "assets${theme}${color}${type}.svg"

    if [[ "$color" == '' ]]; then
      sed -i "s/#333333/${theme_color}/g" "assets${theme}${color}${type}.svg"
    else
      sed -i "s/#E0E0E0/${theme_color}/g" "assets${theme}${color}${type}.svg"
    fi
  else
    if [[ "$theme" != '' ]]; then
      cp -rf "assets${color}.svg" "assets${theme}${color}.svg"

      if [[ "$color" == '' ]]; then
        sed -i "s/#333333/${theme_color}/g" "assets${theme}${color}.svg"
      else
        sed -i "s/#E0E0E0/${theme_color}/g" "assets${theme}${color}.svg"
      fi
    fi
  fi

done
done
done

echo -e "DONE!"
