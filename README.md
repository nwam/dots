# Dots
My collection of config files and scripts including:
 - Theme switching in i3
 - vimrc
 - i3 (wm) configs
 - polybar (statusbar) configs
 - urxvt (term) configs/xdefaults
 - vis (command line music visualizations) colors
 - dunst (notifications) config
 - Multi-monitor madness

## Install
Run `./install_core` to create hard links of most of the config files and scripts to their default locations (mostly in `$HOME`). No theme will be used by default

## Changing themes
After installing and reloading .bashrc (`source ~/.bashrc`) you can use `theme <theme_name>` to change themes. Theme names correspond to file names in the `i3` or `polybar` directories. Current themes are:
 - campfire
 - forest
