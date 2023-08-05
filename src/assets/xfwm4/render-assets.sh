#! /usr/bin/env bash

set -e

INKSCAPE="inkscape"
OPTIPNG="optipng"

ASSETS_DIR="assets"
HD_ASSETS_DIR="assets-hdpi"
XHD_ASSETS_DIR="assets-xhdpi"
SRC_FILE="assets.svg"

LIGHT_ASSETS_DIR="assets-Light"
LIGHT_HD_ASSETS_DIR="assets-Light-hdpi"
LIGHT_XHD_ASSETS_DIR="assets-Light-xhdpi"
LIGHT_SRC_FILE="assets-Light.svg"

NORD_ASSETS_DIR="assets-nord"
NORD_HD_ASSETS_DIR="assets-nord-hdpi"
NORD_XHD_ASSETS_DIR="assets-nord-xhdpi"
NORD_SRC_FILE="assets-nord.svg"

NORD_LIGHT_ASSETS_DIR="assets-Light-nord"
NORD_LIGHT_HD_ASSETS_DIR="assets-Light-nord-hdpi"
NORD_LIGHT_XHD_ASSETS_DIR="assets-Light-nord-xhdpi"
NORD_LIGHT_SRC_FILE="assets-Light-nord.svg"

[[ -d $ASSETS_DIR ]] && rm -rf $ASSETS_DIR
[[ -d $LIGHT_ASSETS_DIR ]] && rm -rf $LIGHT_ASSETS_DIR
[[ -d $NORD_ASSETS_DIR ]] && rm -rf $NORD_ASSETS_DIR
[[ -d $NORD_LIGHT_ASSETS_DIR ]] && rm -rf $NORD_LIGHT_ASSETS_DIR
[[ -d $HD_ASSETS_DIR ]] && rm -rf $HD_ASSETS_DIR
[[ -d $LIGHT_HD_ASSETS_DIR ]] && rm -rf $LIGHT_HD_ASSETS_DIR
[[ -d $NORD_HD_ASSETS_DIR ]] && rm -rf $NORD_HD_ASSETS_DIR
[[ -d $NORD_LIGHT_HD_ASSETS_DIR ]] && rm -rf $NORD_LIGHT_HD_ASSETS_DIR
[[ -d $XHD_ASSETS_DIR ]] && rm -rf $XHD_ASSETS_DIR
[[ -d $LIGHT_XHD_ASSETS_DIR ]] && rm -rf $LIGHT_XHD_ASSETS_DIR
[[ -d $NORD_XHD_ASSETS_DIR ]] && rm -rf $NORD_XHD_ASSETS_DIR
[[ -d $NORD_LIGHT_XHD_ASSETS_DIR ]] && rm -rf $NORD_LIGHT_XHD_ASSETS_DIR
if [[ $# -eq 1 && "$1" = "clean" ]]; then 
  exit
fi

INDEX="assets.txt"

for i in `cat $INDEX`
do

# Normal
mkdir -p $ASSETS_DIR
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-filename=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
fi
mkdir -p $LIGHT_ASSETS_DIR
if [ -f $LIGHT_ASSETS_DIR/$i.png ]; then
    echo $LIGHT_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $LIGHT_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-filename=$LIGHT_ASSETS_DIR/$i.png $LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $LIGHT_ASSETS_DIR/$i.png 
fi

mkdir -p $NORD_ASSETS_DIR
if [ -f $NORD_ASSETS_DIR/$i.png ]; then
    echo $NORD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $NORD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-filename=$NORD_ASSETS_DIR/$i.png $NORD_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $NORD_ASSETS_DIR/$i.png 
fi
mkdir -p $NORD_LIGHT_ASSETS_DIR
if [ -f $NORD_LIGHT_ASSETS_DIR/$i.png ]; then
    echo $NORD_LIGHT_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $NORD_LIGHT_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-filename=$NORD_LIGHT_ASSETS_DIR/$i.png $NORD_LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $NORD_LIGHT_ASSETS_DIR/$i.png 
fi

# HDPI
mkdir -p $HD_ASSETS_DIR
if [ -f $HD_ASSETS_DIR/$i.png ]; then
    echo $HD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $HD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=144 \
              --export-filename=$HD_ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $HD_ASSETS_DIR/$i.png 
fi
mkdir -p $LIGHT_HD_ASSETS_DIR
if [ -f $LIGHT_HD_ASSETS_DIR/$i.png ]; then
    echo $LIGHT_HD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $LIGHT_HD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=144 \
              --export-filename=$LIGHT_HD_ASSETS_DIR/$i.png $LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $LIGHT_HD_ASSETS_DIR/$i.png 
fi

mkdir -p $NORD_HD_ASSETS_DIR
if [ -f $NORD_HD_ASSETS_DIR/$i.png ]; then
    echo $NORD_HD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $NORD_HD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=144 \
              --export-filename=$NORD_HD_ASSETS_DIR/$i.png $NORD_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $NORD_HD_ASSETS_DIR/$i.png 
fi
mkdir -p $NORD_LIGHT_HD_ASSETS_DIR
if [ -f $NORD_LIGHT_HD_ASSETS_DIR/$i.png ]; then
    echo $NORD_LIGHT_HD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $NORD_LIGHT_HD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=144 \
              --export-filename=$NORD_LIGHT_HD_ASSETS_DIR/$i.png $NORD_LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $NORD_LIGHT_HD_ASSETS_DIR/$i.png 
fi

# XHDPI
mkdir -p $XHD_ASSETS_DIR
if [ -f $XHD_ASSETS_DIR/$i.png ]; then
    echo $XHD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $XHD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=192 \
              --export-filename=$XHD_ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $XHD_ASSETS_DIR/$i.png 
fi
mkdir -p $LIGHT_XHD_ASSETS_DIR
if [ -f $LIGHT_XHD_ASSETS_DIR/$i.png ]; then
    echo $LIGHT_XHD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $LIGHT_XHD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=192 \
              --export-filename=$LIGHT_XHD_ASSETS_DIR/$i.png $LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $LIGHT_XHD_ASSETS_DIR/$i.png 
fi

mkdir -p $NORD_XHD_ASSETS_DIR
if [ -f $NORD_XHD_ASSETS_DIR/$i.png ]; then
    echo $NORD_XHD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $NORD_XHD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=192 \
              --export-filename=$NORD_XHD_ASSETS_DIR/$i.png $NORD_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $NORD_XHD_ASSETS_DIR/$i.png 
fi
mkdir -p $NORD_LIGHT_XHD_ASSETS_DIR
if [ -f $NORD_LIGHT_XHD_ASSETS_DIR/$i.png ]; then
    echo $NORD_LIGHT_XHD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $NORD_LIGHT_XHD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=192 \
              --export-filename=$NORD_LIGHT_XHD_ASSETS_DIR/$i.png $NORD_LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $NORD_LIGHT_XHD_ASSETS_DIR/$i.png 
fi

done
exit 0
