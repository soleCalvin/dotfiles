# change default editor
set -U EDITOR nvim
set -U VISUAL nvim

powerline-daemon -q
set fish_function_path $fish_function_path "/usr/lib/python3.6/site-packages/powerline/bindings/fish"
powerline-setup

# Disable greeting
set fish_greeting ""

# Nice ls colours
# set LS_COLORS 'ow=01;96;40:di=01;96;40:fi=00;97;40:ln=00;97;40:ex=00;97;40:no=00;90'
# export LS_COLORS
