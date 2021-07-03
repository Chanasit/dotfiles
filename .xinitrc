#!/bin/sh
xset +fp /usr/share/fonts/TTF           # Prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/noto           # Prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/75dpi           # Prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/100dpi           # Prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/adobe-source-code-pro           # Prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/liberation           # Prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/Type1           # Prepend a custom font path to Xorg's list of known font paths
xset +fp /usr/share/fonts/encodings           # Prepend a custom font path to Xorg's list of known font paths
xset -fp /usr/share/fonts/cantarell     # Remove the specified font path from Xorg's list of known font paths
exec i3
