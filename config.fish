# vim: fdm=marker foldenable

# Variables {{{

set -gx EDITOR nvim

# }}}
# Aliases {{{

# Script shortcuts {{{

abbr -a aclc 'cautoclick -r 1 -n 99999 -p 2000 -i '
abbr -a reloadZSH 'source ~/.zshrc'
abbr -a ww 'sh ~/.config/wacomconfig'

# }}}
# Vim {{{

abbr -a vimvim 'nvim ~/.vimrc' 
abbr -a vimnvim 'nvim ~/.config/nvim/init.vim' 
abbr -a vimzsh 'nvim ~/.zshrc'
abbr -a vimi3 'nvim ~/.config/i3/config'
abbr -a vim 'nvim'
abbr -a v 'nvim'
abbr -a qnvim 'nvim-qt'
abbr -a pyvim 'PYTHONPATH=./ nvim'

# }}}
# cd {{{

abbr -a cdbin 'cd ~/bin/'
abbr -a cdb 'cd ~/builds/'
abbr -a cdc 'cd ~/git/configfiles'

# }}}
# pacman {{{

abbr -a pupg 'sudo pacman -Syu'               # Synchronize with repositories and then upgrade packages that are out of date on the local system.
abbr -a p 'sudo pacman -S'              
abbr -a pu 'sudo pacman -U'             
abbr -a prem 'sudo pacman -Rns'               # Remove the specified package(s), its configuration(s) and unneeded dependencies
abbr -a prepinfo 'pacman -Si'                 # Display information about a given package in the repositories
abbr -a preps 'pacman -Ss'                    # Search for package(s) in the repositories
abbr -a pinfo 'pacman -Qi'                    # Display information about a given package in the local database
abbr -a psearch 'pacman -Qs'                  # Search for package(s) in the local database

# package info
abbr -a pfiles 'pkgfile -l'
abbr -a pfilesupdate 'sudo pkgfile --update'

# aur abbr -aes
# Synchronize with repositories and then upgrade packages that are out of date on the local system.
abbr -a aurupg 'rm -rf ~/.cache/pacaur ; pacaur -Syu --noconfirm --noedit'                  
abbr -a aur 'pacaur -S --noedit'              
abbr -a aurs 'cower --sort votes -s'          # Search
abbr -a aursearch 'cower --sort votes -s'     # Search
abbr -a aurclearcache 'rm -rf ~/.cache/pacaur'

# }}}
# other {{{

abbr -a o 'xdg-open'
abbr -a rnm 'sudo systemctl restart NetworkManager'
abbr -a s 'sudo'                        
abbr -a wylaczScreenSaver 'xset -dpms; xset s off; setterm -blank 0 -powerdown 0'
abbr -a n 'ncmpcpp'
abbr -a shutup 'sudo shutdown -h now'
abbr -a sus 'sudo systemctl suspend'
abbr -a xbox 'sudo xboxdrv -D --detach-kernel-driver'
abbr -a valg 'valgrind --track-origins=yes --leak-check=full'
abbr -a valgv 'valgrind --track-origins=yes --leak-check=full -v'
abbr -a valgs 'valgrind --track-origins=yes'
abbr -a rnm 'sudo systemctl restart NetworkManager'
abbr -a py 'python'
abbr -a ptpython 'ptpython --vi'
abbr -a e 'nvim'
abbr -a ev 'qvim'                               #Editor gui
abbr -a pyev 'pynvim'
abbr -a sx 'startx'
abbr -a winepulsefix 'env PULSE_LATENCY_MSEC=60 wine'       #Fix for audio playing to fast
abbr -a xboxdrvDarkSouls 'sudo xboxdrv --detach-kernel-driver --buttonmap 1=3,3=1,2=4,4=2,rt=start,lt=back,start=rt,back=lt --ui-buttonmap guide=KEY_LEFTSHIFT+KEY_TAB,rt=KEY_END,lt=KEY_G --detach --dbus disabled --daemon' #Fix for not correct mapping in dark souls
abbr -a pulseaudiofix 'env PULSE_LATENCY_MSEC=60'
abbr -a winesteam 'wine "/home/miniu/.wine/drive_c/Program Files (x86)/Steam/Steam.exe" --no-dwrite'
abbr -a pasds 'pactl set-default-sink'
abbr -a pals 'pactl list sinks'
abbr -a palsb 'pactl list sinks | grep -B 2 Blaster'
abbr -a wacomDisableTouch "xsetwacom --set 'Wacom Bamboo 2FG 4x5 Finger touch' touch off"
abbr -a irc 'weechat'
abbr -a youtube-dl-allnighter 'youtube-dl -i --retries infinite'
abbr -a i3-exit 'i3-msg exit'
abbr -a set_backlight 'sudo tee /sys/class/backlight/intel_backlight/brightness <<< ' # Set backlight on laptopn goes from 0 to 999
abbr -a hdmi 'xrandr --output HDMI-1 --auto'  # Enable HDMI on laptop

# }}}

# }}}
# Functions {{{

# Change directory and print it's content
function c
    cd $argv
    ls
end

# Custom ls
function l
    ls -1 --size --human-readable --group-directories-first --color=auto --dereference -H $argv
end

# }}}
