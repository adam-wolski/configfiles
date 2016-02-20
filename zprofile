export TERMINAL=konsole
export NVIM_TUI_ENABLE_TRUE_COLOR=True
setvtrgb ~/git/configfiles/vtrgb
(echo `dumpkeys |grep -i keymaps`; echo keycode 58 = Escape) | sudo loadkeys -
