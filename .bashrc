# shellcheck shell=bash source=/dev/null
# /etc/skel/.bashrc
#
# This file is .d by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now!
	return
fi
shopt -s histverify
shopt -s globstar
shopt -s checkhash
shopt -s mailwarn

if [[ -f ~/.local/share/zinit/plugins/pinyin-completion/shell/pinyin-comp.bash ]]; then
	. ~/.local/share/zinit/plugins/pinyin-completion/shell/pinyin-comp.bash
fi

if command -v wakatime &>/dev/null &&
	[[ -f ~/.local/share/bash/bash-wakatime/bash-wakatime.sh ]]; then
	. ~/.local/share/bash/bash-wakatime/bash-wakatime.sh
fi

if command -v tmux &>/dev/null &&
	[[ $OSTYPE == linux-gnu && -z $TMUX$SSH_TTY$HOMEBREW_DEBUG_INSTALL ]]; then
	if [[ $KITTY_WINDOW_ID == 1 || $WEZTERM_PANE == 0 ]]; then
		exec tmux new -As0
	elif [[ $TERM == linux ]]; then
		tmux new -As0
	fi
fi

# Put your fun stuff here.
HISTIGNORE='&: *'
PS1='\[\e[37;44m\d\t\e[34;41m\e[30m\s\e[31;42m\e[30m\u\e[32;43m\e[30m\h\e[33;45m\e[30m\w\e[35;40m\e[37m\]\n '
PS2='--> '
PS3='? '

stty -ixon
