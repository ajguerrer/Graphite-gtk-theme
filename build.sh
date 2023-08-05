#! /usr/bin/env bash

set -e

if [[ $# -eq 1 && "$1" = "clean" ]]; then
  pushd src/assets/gtk || exit
  ./render-assets.sh "clean"
  popd || exit

  pushd src/assets/gtk-2.0 || exit
  ./render-theme.sh "clean"
  ./render-assets.sh "clean"
  popd || exit

  pushd src/assets/xfwm4 || exit
  ./render-assets.sh "clean"
  popd || exit

  pushd src/assets/gnome-shell || exit
  ./make-assets.sh "clean"
  popd || exit

  pushd other/grub2/assets || exit
  ./render-all.sh "clean"
  popd || exit

  pushd other/grub2/backgrounds || exit
  ./render-all.sh "clean"
  popd || exit
else
  # nix-shell -p sassc resvg inkscape optipng
  ./parse-sass.sh
  # ./gtkrc.sh

  pushd src/assets/gtk || exit
  ./render-assets.sh &
  popd || exit

  pushd src/assets/gtk-2.0 || exit
  ./render-theme.sh && ./render-assets.sh &
  popd || exit

  pushd src/assets/xfwm4 || exit
  ./render-assets.sh &
  popd || exit

  pushd src/assets/gnome-shell || exit
  ./make-assets.sh &
  popd || exit

  pushd other/grub2/assets || exit
  ./render-all.sh &
  popd || exit

  pushd other/grub2/backgrounds || exit
  ./render-all.sh &
  popd || exit

  wait
fi
