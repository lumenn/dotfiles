if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

alias ssh="kitty +kitten ssh"
alias vim="nvim"
alias terraform="tofu"
alias tf="tofu"

export EDITOR=nvim

# KeePassXC<->ssh socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Created by `pipx` on 2024-06-20 15:43:13
export PATH="$PATH:/home/lumenn/.local/bin"