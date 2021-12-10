#!/bin/sh
export QT_AUTO_SCREEN_SCALE_FACTOR="0"
xrdb -merge .Xresources
exec i3
