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

STONEROSE_ASSETS_DIR="assets-stonerose"
STONEROSE_HD_ASSETS_DIR="assets-stonerose-hdpi"
STONEROSE_XHD_ASSETS_DIR="assets-stonerose-xhdpi"
STONEROSE_SRC_FILE="assets-stonerose.svg"

STONEROSE_LIGHT_ASSETS_DIR="assets-Light-stonerose"
STONEROSE_LIGHT_HD_ASSETS_DIR="assets-Light-stonerose-hdpi"
STONEROSE_LIGHT_XHD_ASSETS_DIR="assets-Light-stonerose-xhdpi"
STONEROSE_LIGHT_SRC_FILE="assets-Light-stonerose.svg"

[[ -d $ASSETS_DIR ]] && rm -rf $ASSETS_DIR
[[ -d $LIGHT_ASSETS_DIR ]] && rm -rf $LIGHT_ASSETS_DIR
[[ -d $STONEROSE_ASSETS_DIR ]] && rm -rf $STONEROSE_ASSETS_DIR
[[ -d $STONEROSE_LIGHT_ASSETS_DIR ]] && rm -rf $STONEROSE_LIGHT_ASSETS_DIR
[[ -d $HD_ASSETS_DIR ]] && rm -rf $HD_ASSETS_DIR
[[ -d $LIGHT_HD_ASSETS_DIR ]] && rm -rf $LIGHT_HD_ASSETS_DIR
[[ -d $STONEROSE_HD_ASSETS_DIR ]] && rm -rf $STONEROSE_HD_ASSETS_DIR
[[ -d $STONEROSE_LIGHT_HD_ASSETS_DIR ]] && rm -rf $STONEROSE_LIGHT_HD_ASSETS_DIR
[[ -d $XHD_ASSETS_DIR ]] && rm -rf $XHD_ASSETS_DIR
[[ -d $LIGHT_XHD_ASSETS_DIR ]] && rm -rf $LIGHT_XHD_ASSETS_DIR
[[ -d $STONEROSE_XHD_ASSETS_DIR ]] && rm -rf $STONEROSE_XHD_ASSETS_DIR
[[ -d $STONEROSE_LIGHT_XHD_ASSETS_DIR ]] && rm -rf $STONEROSE_LIGHT_XHD_ASSETS_DIR
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

mkdir -p $STONEROSE_ASSETS_DIR
if [ -f $STONEROSE_ASSETS_DIR/$i.png ]; then
    echo $STONEROSE_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $STONEROSE_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-filename=$STONEROSE_ASSETS_DIR/$i.png $STONEROSE_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $STONEROSE_ASSETS_DIR/$i.png 
fi
mkdir -p $STONEROSE_LIGHT_ASSETS_DIR
if [ -f $STONEROSE_LIGHT_ASSETS_DIR/$i.png ]; then
    echo $STONEROSE_LIGHT_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $STONEROSE_LIGHT_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-filename=$STONEROSE_LIGHT_ASSETS_DIR/$i.png $STONEROSE_LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $STONEROSE_LIGHT_ASSETS_DIR/$i.png 
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

mkdir -p $STONEROSE_HD_ASSETS_DIR
if [ -f $STONEROSE_HD_ASSETS_DIR/$i.png ]; then
    echo $STONEROSE_HD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $STONEROSE_HD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=144 \
              --export-filename=$STONEROSE_HD_ASSETS_DIR/$i.png $STONEROSE_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $STONEROSE_HD_ASSETS_DIR/$i.png 
fi
mkdir -p $STONEROSE_LIGHT_HD_ASSETS_DIR
if [ -f $STONEROSE_LIGHT_HD_ASSETS_DIR/$i.png ]; then
    echo $STONEROSE_LIGHT_HD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $STONEROSE_LIGHT_HD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=144 \
              --export-filename=$STONEROSE_LIGHT_HD_ASSETS_DIR/$i.png $STONEROSE_LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $STONEROSE_LIGHT_HD_ASSETS_DIR/$i.png 
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

mkdir -p $STONEROSE_XHD_ASSETS_DIR
if [ -f $STONEROSE_XHD_ASSETS_DIR/$i.png ]; then
    echo $STONEROSE_XHD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $STONEROSE_XHD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=192 \
              --export-filename=$STONEROSE_XHD_ASSETS_DIR/$i.png $STONEROSE_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $STONEROSE_XHD_ASSETS_DIR/$i.png 
fi
mkdir -p $STONEROSE_LIGHT_XHD_ASSETS_DIR
if [ -f $STONEROSE_LIGHT_XHD_ASSETS_DIR/$i.png ]; then
    echo $STONEROSE_LIGHT_XHD_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $STONEROSE_LIGHT_XHD_ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-dpi=192 \
              --export-filename=$STONEROSE_LIGHT_XHD_ASSETS_DIR/$i.png $STONEROSE_LIGHT_SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $STONEROSE_LIGHT_XHD_ASSETS_DIR/$i.png 
fi

done
exit 0
