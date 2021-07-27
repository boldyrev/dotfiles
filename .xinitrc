[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xset fp+ ~/.local/share/fonts
xset fp+ ~/.local/share/fonts/misc
xset fp rehash

exec i3
