set fish_greeting

set CUDA_VISIBLE_DEVICES 0,1

alias c clear
alias ls "eza --icons=always --group-directories-first -F"
alias la "ls -lah"
alias ll "ls -lh"

fish_add_path ~/flutter_sdk/flutter/bin
fish_add_path ~/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
    bind -M insert \t accept-autosuggestion
end

starship init fish | source # init starship
zoxide init --cmd cd fish | source # init zoxide (autojump)

