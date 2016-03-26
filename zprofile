export TERMINAL=konsole
export NVIM_TUI_ENABLE_TRUE_COLOR=True
export RUST_SRC_PATH=/usr/local/rust/rust/src
setvtrgb $HOME/.config/vtrgb
(echo `dumpkeys |grep -i keymaps`; echo keycode 58 = Escape) | sudo loadkeys -
