export PULSE_SERVER=tcp:localhost
export DISPLAY=:0
cd ~

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
