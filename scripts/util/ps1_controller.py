"""
PS1 Controller allows you to dynamically switch your bash prompt colors.

The main uses of PS1 Controller are to:
 - Set prompt colors when changing themes
 - Randomly select a prompt colors for each new terminal or even each prompt.
"""

# TODO: changing the prompt color dynamically/even at each prompt/each new terminal via the use of storing the PS1 variable in a file and reading it each new terminal or reading it each prompt via the variable PROMPT_COMMAND. PROMPT_COMMAND=source ~/.ps1. Can change it for each new terminal by having ~/.ps1 call this script to update itself.

import os
import re
import argparse
import enum
import subprocess
import json

PS1_EXPORT_TEMPLATE = 'export PS1="{}"'
PS1_TEMPLATE = r'\[\e[{}m\]\u\[\e[m\]\[\e[{}m\]@\[\e[m\]\[\e[{}m\]\h\[\e[m\]\[\e[{}m\]:\[\e[m\]\[\e[{}m\]\W\[\e[m\]\[\e[{}m\]\\$\[\e[m\] '

BASHRC = os.path.expanduser('~/.bashrc')
CONFIG = os.path.expanduser('~/.config/ps1_controller/config')
PS1_FILE = os.path.expanduser('~/.ps1')
PS1_FILE_BASH = '$HOME/.ps1'

PROPERTIES = {'bold': 1, 'dim': 2, 'underlined': 3, 'inverted': 7}
BASE_COLORS = {'black': 0, 'red': 1, 'green': 2, 'yellow': 3, 'blue': 4,
        'magenta': 5, 'cyan': 6, 'gray': 7, 'default': 9}
FOREGROUND_COLORS = {}
for color in BASE_COLORS:
    FOREGROUND_COLORS[color] = 30 + BASE_COLORS[color]
    FOREGROUND_COLORS['l{}'.format(color)] = 90 + BASE_COLORS[color]
BACKGROUND_COLORS = {}
for color in FOREGROUND_COLORS:
    BACKGROUND_COLORS['bg_{}'.format(color)] = 10 + FOREGROUND_COLORS[color]
PROPERTIES = {**PROPERTIES, **FOREGROUND_COLORS, **BACKGROUND_COLORS}


def add_source_to_file(filename = BASHRC, sourced_file = PS1_FILE_BASH):
    """ Makes sure that bash sources ~/.ps1 """
    if not sources_file(filename, sourced_file):
        source_file(filename, sourced_file)

def source_file(filename, sourced_file):
    with open(filename, 'a') as f:
        command = '\n# Load custom prompt\n\
                   export PROMPT_COMMAND="source {}"\n'.format(sourced_file)
        f.write(command)

def sources_file(filename, sourced_file):
    command = 'export PROMPT_COMMAND="source {}"\n'.format(sourced_file)
    with open(filename, 'r') as f:
        for line in f:
            if line == command:
                return True
    return False

def names_to_code(names):
    """ Converts a comma-separated string of PS1 names to a PS1 code. """
    code = ''
    names = names.split(',')
    for i, name in enumerate(names):
        code += str(PROPERTIES[name])
        if i < len(names) - 1:
            code += ';'
    return code

def load_config(filename):
    with open(filename, 'r') as f:
        return json.load(f)

def update_ps1():
    config = load_config(CONFIG)

    u = names_to_code(config[0])
    a = names_to_code(config[1])
    h = names_to_code(config[2])
    c = names_to_code(config[3])
    w = names_to_code(config[4])
    p = names_to_code(config[5])

    add_source_to_file(BASHRC, PS1_FILE_BASH)

    with open(PS1_FILE, 'w') as f:
        ps1 = PS1_TEMPLATE.format(u, a, h, c, w, p)
        command = PS1_EXPORT_TEMPLATE.format(ps1)
        f.write(command)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
            description = 'Change the colors of the command prompt.\n'
                    'Colors and properties can be combined with commas '
                    '(and no spaces).\nFor example:\n\t"bold,lblue,bg_lgray"\n'
                    'will be bold light blue text with a light gray (white) '
                    'backgrond.\n\n'
                    'Available properties:\n\tbold, dim, underlined, inverted.'
                    '\nAvailable colors:\n\tdefault, black, red, green, yellow,'
                    ' blue, magenta, cyan, gray, l*, bg_*.\n\n'
                    'All colors are availbe as light and background colors as '
                    'well.\nThis can be done by using l* and bg_*, '
                    'respectively, where * is a color name.\n'
                    'bg_* can also use l* colors, for example, "bg_lgray" is '
                    'a white background.',
            formatter_class = argparse.RawTextHelpFormatter)
    args = parser.parse_args()
