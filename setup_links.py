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

    link(path.join(CDIR, "gtkrc-2.0.mine"),
         "~/.gtkrc-2.0.mine",
         FORCE)
    link(path.join(CDIR, "i3", "i3pystatus_config.py"),
         "~/.i3/i3pystatus_config.py",
         FORCE)
    link(path.join(CDIR, "i3", "config"),
         "~/.i3/config",
         FORCE)
    link(path.join(CDIR, "Xmodmap"),
         "~/.Xmodmap",
         FORCE)
    link(path.join(CDIR, "Xresources"),
         "~/.Xresources",
         FORCE)
    link(path.join(CDIR, "zshrc"),
         "~/.zshrc",
         FORCE)
    link(path.join(CDIR, "zprofile"),
         "~/.zprofile",
         FORCE)

    # Vim
    link(path.join(CDIR, "vim", "vimrc"),
         "~/.vimrc",
         FORCE)
    link(path.join(CDIR, "vim", "gvimrc"),
         "~/.gvimrc",
         FORCE)

    link(path.join(CDIR, "vim", "ycm_extra_conf_c.py"),
         "~/.config/.ycm_extra_conf_c.py",
         FORCE)

    link(path.join(CDIR, "vim", "filetype"),
         "~/.vim/ftplugin",
         FORCE)

    link(path.join(CDIR, "vim", "syntax"),
         "~/.vim/syntax",
         FORCE)

    link(path.join(CDIR, "vim", "snippets"),
         "~/.vim/mysnippets",
         FORCE)

