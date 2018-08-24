alias sus='sudo pm-suspend'

alias enhance_resolution='function ne() { sudo docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "input/`basename ${@:$#}`"; }; ne'

# key
alias f='thunar . >/dev/null &>/dev/null &'
alias o='xdg-open 1>/dev/null 2>&1'
alias l='ls'

# aliases
alias ff='firefoxlink'

# <3 3
alias python='python3'
alias pip='pip3'

# don't want to remember/type
alias untargz='tar -zxvf'
alias clip='xclip -selection c'
alias bc='bc -l -q'

# brightness
alias bright='light -S 100'
alias dim='light -S 1'

# wifi
alias reset_wifi='nmcli radio wifi off && sleep 5 && nmcli radio wifi on'

# hardware
alias mirror_display='xrandr --output HDMI-2 --auto --same-as eDP-1'
alias disable_middle_click='xmodmap -e "pointer = 1 25 3 4 5 6 7 8 9"'
alias enable_middle_click='xmodmap -e "pointer = 1 2 3 4 5 6 7 8 9"'

# music
alias cl='clementine'
alias clf='clementine -f'
alias clr='clementine -r'
alias clo='clementine -o'
alias clp='clementine -t'
alias clv='clementine -v'

# media
alias bg='nitrogen --zet-zoom-fill'

# nav
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# bash control
alias please='sudo $(history -p !!)'
alias reload='. ~/.bashrc'

# make a script already
alias midi='mv ~/Downloads/*.mid ~/Documents/sheet; midisheetmusic.mono.exe >/dev/null &>/dev/null &'

# pacman
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias acs='sudo apt-cache search'
alias agu='sudo apt-get update'

# terminal color switcher (cc=change color)
alias ccl='dynamic-colors switch atelierforest-light'
alias ccd='dynamic-colors switch atelierforest-dark'
