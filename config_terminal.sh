#!/bin/bash

# Configure terminal
# shellcheck disable=2154

# Define color aliases
alias color_reset='\[\033[00m\]'
alias color_cyan='\[\033[01;36m\]'
alias color_blue='\[\033[01;34m\]'

# Set the prompt with aliases for color
PS1='🐳 ${debian_chroot:+($debian_chroot)}${color_cyan}\u@\h${color_reset}:${color_blue}\w${color_reset}\$ '

# Trim directory path length
PROMPT_DIRTRIM=3
