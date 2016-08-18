from os import path
import shutil
from platform import system
from subprocess import Popen

if system() == 'Windows':
    from win32file import CreateSymbolicLink
    BLENDER_FOLDER = "~/AppData/Roaming/Blender Foundation/Blender/2.77/config/"
else:
    BLENDER_FOLDER = "~/.config/Blender Foundation/Blender/2.77/config/"



def link(target, lnk, force=False):
    """
    Creates symbolic link 'lnk' pointing to 'target'.
    """

    if system() not in ('Linux', 'Windows', 'MSYS_NT-6.1'):
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

    if system() in ('Linux', 'MSYS_NT-6.1'):
        Popen(['ln', '-s', target, lnk]).wait()
    elif system() == 'Windows':
        if isdir:
            CreateSymbolicLink(lnk, target, 1)
        else:
            CreateSymbolicLink(lnk, target, 0)


if __name__ == "__main__":
    CDIR = path.dirname(path.abspath(__file__))
    startup_file = "startup.blend"
    prefs_file = "userpref.blend"

    blender_startup_file = path.expanduser(path.join(BLENDER_FOLDER, startup_file))
    blender_prefs_file = path.expanduser(path.join(BLENDER_FOLDER, prefs_file))
    this_startup_file = path.expanduser(path.join(CDIR, startup_file))
    this_prefs_file = path.expanduser(path.join(CDIR, prefs_file))

    if int(input("(1): Copy configuration from blender folder to this one.\n"
                 " 2 : Link configuration from this folder to blenders\n"
                 ": ")) == 2:
        link(this_startup_file, blender_startup_file)
        link(this_prefs_file, blender_prefs_file)
    else:
        shutil.copyfile(blender_startup_file, this_startup_file)
        shutil.copyfile(blender_prefs_file, this_prefs_file)
