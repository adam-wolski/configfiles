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

    NAME = 'gtkrc-2.0.mine'
    link(path.join(CDIR, "{}".format(NAME)),
         "~/.{}".format(NAME),
         FORCE)

    NAME = 'i3pystatus_config.py'
    link(path.join(CDIR, "i3", "{}".format(NAME)),
         "~/.i3/{}".format(NAME),
         FORCE)

    NAME = 'config'
    link(path.join(CDIR, "i3", "{}".format(NAME)),
         "~/.i3/{}".format(NAME),
         FORCE)

    NAME = 'Xresources'
    link(path.join(CDIR, "{}".format(NAME)),
         "~/.{}".format(NAME),
         FORCE)

    NAME = 'zshrc'
    link(path.join(CDIR, "{}".format(NAME)),
         "~/.{}".format(NAME),
         FORCE)

    NAME = 'zprofile'
    link(path.join(CDIR, "{}".format(NAME)),
         "~/.{}".format(NAME),
         FORCE)

    # Vim
    NAME = 'vimrc'
    link(path.join(CDIR, "vim", "{}".format(NAME)),
         "~/.{}".format(NAME),
         FORCE)

    NAME = 'gvimrc'
    link(path.join(CDIR, "vim", "{}".format(NAME)),
         "~/.{}".format(NAME),
         FORCE)

    NAME = 'ycm_extra_conf_c.py'
    link(path.join(CDIR, "vim", "{}".format(NAME)),
         "~/.config/.{}".format(NAME),
         FORCE)

    # Link Vim directories
    link(path.join(CDIR, "vim", "filetype"),
         "~/.vim/ftplugin",
         FORCE)

    link(path.join(CDIR, "vim", "syntax"),
         "~/.vim/syntax",
         FORCE)

    link(path.join(CDIR, "vim", "snippets"),
         "~/.vim/mysnippets",
         FORCE)

