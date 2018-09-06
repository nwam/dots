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
Run `./install_core` to create hard links of most of the config files and scripts to their default locations (mostly in `$HOME`). You will need to reinstall if you move this repo. No theme will be used by default.

## Changing Themes
After installing you can use `theme <theme_name>` to change themes (bash completion is supported). Theme names correspond to file names in the `i3` directory (except `template`).

## Creating Themes
Currently, the `theme` command supports config files for `i3`, `polybar`, `Xdefaults`, and `vis` and has a respective directory for each of these. To create a theme, add a config file called `<theme_name>` to each of these direcories. Each config file should include all settings for the theme except for settings in the `template` file.

### Template Files
Features of config files which should be shared amongst all themes should be placed in the `template` files. This usually includes options such as i3 key bindings, vis' audio source, and non-aesthetic Xdefaults settings. When applying a new theme, the theme's config file is appended to the template file.
