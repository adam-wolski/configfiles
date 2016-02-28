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

if system() == 'Windows':
    from win32file import CreateSymbolicLink

LINKS = {
    # 'filename': ['relative/path/from/config/to/target/{}'
    #              'full/path/to/link/{}']
    # {} will be used in formating to paste filename in path.

    'gtkrc-2.0.mine': ["{}",
                       "~/.{}"],

    'MASTERSCRIPT': ["{}",
                     "~/.{}"],

    'vtrgb': ["{}",
              "~/.config/{}"],

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

    'ycm_extra_conf.py': ["vim/{}",
                          "~/.config/{}"],

    'ycm_extra_conf_cpp.py': ["vim/{}",
                              "~/.config/{}"],

    'SemanticHighlightPluginSettings.vim': ["vim/{}",
                                            "~/.config/{}"],

    # Vim folders
    'filetype_folder': ["vim/filetype",
                        "~/.vim/ftplugin"],

    'syntax': ["vim/{}",
               "~/.vim/{}"],

    'snippets_folder': ["vim/snippets",
                        "~/.vim/mysnippets"],

    'after': ["vim/after",
              "~/.vim/after"],
    }

LINKS_WIN = {
    # Vim
    'vimrc': [r"vim\{}",
              r"~\_{}"],

    'gvimrc': [r"vim\{}",
               r"~\_{}"],

    'SemanticHighlightPluginSettings.vim': [r"vim\{}",
                                            r"~\.config\{}"],

    # Vim folders
    'filetype_folder': [r"vim\filetype",
                        r"~\vimfiles\ftplugin"],

    'syntax': [r"vim\{}",
               r"~\vimfiles\{}"],

    'snippets_folder': [r"vim\snippets",
                        r"~\vimfiles\mysnippets"],

    'after': [r"vim\after",
              r"~\.vim\after"],
    }

def link(target, lnk, force=False):
    """
    Creates symbolic link 'lnk' pointing to 'target'.
    """

    if system() != 'Linux' and system() != 'Windows':
        print("{} operating system is not supported.".format(system()))
        return

    isdir = False

    lnk = path.normpath(path.expandvars(path.expanduser(lnk)))
    target = path.normpath(path.expandvars(path.expanduser(target)))

    print("\n{} -> {}".format(lnk, target))

    if path.isdir(lnk) or path.isfile(lnk):
        if path.isdir(lnk):
            isdir = True
        if not force:
            print("'{}': link exists".format(lnk))
            return
        else:
            remove(lnk)

    if system() == 'Linux':
        Popen(['ln', '-s', target, lnk]).wait()
    elif system() == 'Windows':
        if isdir:
            CreateSymbolicLink(lnk, target, 1)
        else:
            CreateSymbolicLink(lnk, target, 0)

if __name__ == '__main__':

    CDIR = path.dirname(path.abspath(__file__))

    try:
        FORCE = argv[1] in ('f', '-f', 'F', '-F')
    except IndexError:
        FORCE = False

    if system() == 'Windows':
        LINKS = LINKS_WIN

    for l in LINKS.keys():
        link(path.join(CDIR,
                       LINKS[l][0].format(l)),
             LINKS[l][1].format(l),
             FORCE)

    if system() == 'Windows':
        input('\nDONE')
