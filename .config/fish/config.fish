set fish_greeting

set CUDA_VISIBLE_DEVICES 0,1

alias c clear
alias ls "eza --icons=always --group-directories-first -F"
alias la "ls -lah"
alias ll "ls -lh"
alias edit "ms-edit"

fish_add_path ~/flutter_sdk/flutter/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
    bind -M insert \t accept-autosuggestion
end

# STARSHIP
function starship_transient_prompt_func
    starship module character
end

starship init fish | source # init starship
enable_transience
# STARSHIP END
#

zoxide init --cmd cd fish | source # init zoxide (autojump)

thefuck --alias | source

fish_add_path /home/kiwi/.spicetify
