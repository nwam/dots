import subprocess
import os
import re
from .command_all_terminals import command_all_terminals

SCHEME_NAME = 'default'
PROP_RE = re.compile('^(.*)\.(.*?)\s*:')
ACCEPTED_GROUPS = ['urxvt', '*']
COLOR_RE = re.compile('^.*:\s*(#[a-fA-F0-9]{6})\s*$')
ACCEPTED_PROP_RE = re.compile('foreground|background|cursorColor|color\d[0-5]?$')
PROP_MAP = {'cursorColor' : 'cursor'}

def update_terminal_colors(dynamic_colors_bin, scheme):
    cmd = '{} switch {}'.format(dynamic_colors_bin, scheme)
    command_all_terminals(cmd)

def generate_dynamic_color_scheme(xdefaults):
    scheme = ''
    with open(xdefaults, 'r') as f:
        for line in f:

            prop_match =  PROP_RE.match(line)
            if prop_match and \
                        prop_match.group(1).lower() in ACCEPTED_GROUPS and \
                        ACCEPTED_PROP_RE.match(prop_match.group(2)):

                prop = prop_match.group(2)
                if prop in PROP_MAP:
                    prop = PROP_MAP[prop]

                color_match = COLOR_RE.match(line)
                if not color_match:
                    continue
                color = color_match.group(1)

                scheme += '{}="{}"\n'.format(prop, color)
    return scheme


def update_urxvt_colors():
    dynamic_colors_path = os.path.expanduser('~/.dynamic-colors')
    dynamic_colors_bin = os.path.join(dynamic_colors_path, \
                'bin/dynamic-colors')
    dynamic_colors_scheme = os.path.join(dynamic_colors_path, \
                'colorschemes/{}.sh'.format(SCHEME_NAME))
    xdefaults = os.path.expanduser('~/.Xdefaults')

    scheme = generate_dynamic_color_scheme(xdefaults)
    with open(dynamic_colors_scheme, 'w') as f:
        f.write(scheme)

    update_terminal_colors(dynamic_colors_bin, SCHEME_NAME)

