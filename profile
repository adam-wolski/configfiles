# Set ag as the default source for fzf
# Helps with .gitignore files.
export FZF_DEFAULT_COMMAND='ag -g ""'

export TERMINAL=xterm

export NVIM_TUI_ENABLE_TRUE_COLOR=True

export RUST_SRC_PATH=/usr/local/rust/rust/src
export CARGO_HOME=$HOME/.cargo

export KEYTIMEOUT=1

setvtrgb $HOME/.config/vtrgb

(echo `dumpkeys |grep -i keymaps`; echo keycode 58 = Escape) | sudo loadkeys -

export PATH="~/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl"
PATH=$HOME/bin:$PATH
PATH=$HOME/.gem/ruby/2.1.0/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/.multirust/toolchains/stable/cargo/bin:$PATH
PATH=$HOME/.multirust/toolchains/nightly/cargo/bin:$PATH

# Start ssh-agent and X session on login
[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && exec ssh-agent startx
