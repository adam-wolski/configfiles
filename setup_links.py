"""
File: setup_links.py
Author: Adam Wolski
Email: miniupuchaty@gmail.com
Github: https://github.com/miniukov
Description: Setup links to they specified paths.
"""

from sys import argv
from platform import system
from os import path
from os import remove
from subprocess import Popen

LINKS = {
    # 'filename': ['relative/path/from/config/to/target/{}'
    #              'full/path/to/link/{}']
    # {} will be used in formating to paste filename in path.

    'gtkrc-2.0.mine': ["{}",
                       "~/.{}"],

    'i3pystatus_config.py': ["i3/{}",
                             "~/.i3/{}"],

    'config': ["i3/{}",
               "~/.i3/{}"],

    'Xresources': ["{}",
                   "~/.{}"],

    'zshrc': ["{}",
              "~/.{}"],

    'zprofile': ["{}",
                 "~/.{}"],

    # Vim
    'vimrc': ["vim/{}",
              "~/.{}"],

    'gvimrc': ["vim/{}",
               "~/.{}"],

    'ycm_extra_conf_c.py': ["vim/{}",
                            "~/.config/.{}"],

    # Vim folders
    'filetype_folder': ["vim/filetype",
                        "~/.vim/ftplugin"],

    'syntax': ["vim/{}",
               "~/.vim/{}"],

    'snippets_folder': ["vim/snippets",
                        "~/.vim/mysnippets"],
    }

def link(target, lnk, force=False):
    """
    Creates symbolic link 'lnk' pointing to 'target'.
    """

    if system() != 'Linux':
        print("{} operating system is not supported.".format(system()))
        return

    lnk = path.expandvars(path.expanduser(lnk))
    target = path.expandvars(path.expanduser(target))

    print("\n{} -> {}".format(lnk, target))

    if path.isdir(target):
        if path.isdir(lnk):
            if not force:
                print("failed to create folder link"
                      " '{}': Folder exists".format(lnk))
                return
            else:
                remove(lnk)

    if force:
        if system() == 'Linux':
            com = ['ln', '-sf', target, lnk]
    else:
        if system() == 'Linux':
            com = ['ln', '-s', target, lnk]

    Popen(com).wait()

if __name__ == '__main__':

    CDIR = path.dirname(path.abspath(__file__))

    try:
        FORCE = argv[1] in ('f', '-f', 'F', '-F')
    except IndexError:
        FORCE = False

    for l in LINKS.keys():
        link(path.join(CDIR,
                       LINKS[l][0].format(l)),
             LINKS[l][1].format(l),
             FORCE)
