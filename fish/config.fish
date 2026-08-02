if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x EDITOR nvim
    set -x BROWSER brave

    fzf --fish | source

    # Scripts of things I've installed manually and don't want to pollute the system files with
    set -x GPG_TTY $(tty)
    fish_add_path "$HOME/go/bin"
    fish_add_path "$HOME/workspace/programs"
    fish_add_path "$HOME/.cargo/bin"
    fish_add_path "$HOME/.local/bin"
    #set -x PATH "$HOME/.pyenv/bin:$PATH"

    #pyenv init - | source

    alias gits='git status'
    alias gitf='git fetch'
    alias gitfa='git fetch --all --tags --force'
    alias glog='git log --oneline --decorate'
    alias gloga='git log --oneline --decorate --all'
    alias ls='ls -a --color=auto'
    alias lsal='ls -al --color=auto'

    # yazi wrapper function so when you hit q to quit you drop to yazi's cwd
    # rather than the directory you were in when you launched yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        command rm -f -- "$tmp"
    end
end
