### ENV VAR's ###
set fish_greeting
set CUDA_VISIBLE_DEVICES 0,1
set EDITOR nvim
set JAVA_TOOL_OPTIONS --enable-native-access=ALL-UNNAMED

### ALIAS ###
alias c clear

# files
alias ls_ "eza --icons=auto --group-directories-first -F"
alias ls "ls_ -a"
alias la "ls_ -lah"
alias lav "la --total-size"
alias ll "ls -lh"
alias tree "ls_ --tree"

# shell
alias reload_shell "source ~/.config/fish/config.fish"

# programs
alias hx helix
alias edit msedit
alias df duf
alias yayf "yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias yay "yay --noconfirm --answerdiff none --answerclean All"

### PATH ###
fish_add_path ~/flutter_sdk/flutter/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

### FUNCTIONS ###
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# function fish_user_key_bindings
#   # keybinds
# end

# STARSHIP
function starship_transient_prompt_func
    starship module character
end

starship init fish | source # init starship
enable_transience
# STARSHIP END

zoxide init --cmd cd fish | source # init zoxide (autojump)

# pyenv 
pyenv init - fish | source

fish_add_path /home/kiwi/.spicetify
fish_add_path /home/kiwi/.dotnet/tools
fish_add_path /home/kiwi/.pub-cache/bin

# TMUX
if type -q tmux
    if not set -q TMUX
        tmux new-session
    end
end
