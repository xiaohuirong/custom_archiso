if status is-interactive
    # Commands to run in interactive sessions can go here
    export MANPAGER='nvim +Man!'
    set -g fish_key_bindings fish_vi_key_bindings
end
