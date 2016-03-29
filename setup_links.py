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

    'synaptic_settings': ["{}",
                          "~/.config/{}"],

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
    'ftplugin': ["vim/{}",
                 "~/.vim/{}"],

    'plugin': ["vim/{}",
               "~/.vim/{}"],

    'syntax': ["vim/{}",
               "~/.vim/{}"],

    'colors': ["vim/{}",
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
    'ftplugin': [r"vim\{}",
                 r"~\vimfiles\{}"],

    'syntax': [r"vim\{}",
               r"~\vimfiles\{}"],

    'colors': [r"vim\{}",
               r"~\vimfiles\{}"],

    'snippets_folder': [r"vim\snippets",
                        r"~\vimfiles\mysnippets"],

    'after': [r"vim\{}",
              r"~\vimfiles\{}"],
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
    if path.isdir(target):
        isdir = True
    target = path.normpath(path.expandvars(path.expanduser(target)))

    if isdir:
        print("\n{} -> {} : DIR".format(lnk, target))
    else:
        print("\n{} -> {} : FILE".format(lnk, target))

    if path.isdir(lnk) or path.isfile(lnk):
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
