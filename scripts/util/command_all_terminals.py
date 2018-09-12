import subprocess
import os

def command_all_terminals(cmd):
    pts = os.listdir('/dev/pts/')
    for pt in pts:
         if pt.isdigit():
             subprocess.call('echo "`{}`" > /dev/pts/{}'
                        .format(cmd, pt), shell=True)
