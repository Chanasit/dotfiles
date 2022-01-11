#!/bin/sh
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_FONT_DPI=156
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GDK_DPI_SCALE=0.80
export GDK_SCALE=0
xrdb -merge .Xresources
exec i3
