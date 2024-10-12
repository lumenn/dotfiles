if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

alias ssh="kitty +kitten ssh"
alias vim="nvim"
alias terraform="tofu"
alias tf="tofu"
alias spotify="spt"
alias wireshark="sudo termshark"
alias icat="kitten icat"

export EDITOR=nvim

# KeePassXC<->ssh socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PATH="$PATH:/home/lumenn/.local/bin"
export PATH="$PATH:/home/lumenn/.cargo/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


