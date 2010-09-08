#!/bin/bash

export VERSION_CONTROL=t	
[[ -f /etc/bash_completion ]] && . /etc/bash_completion 
# 0	Reset all attributes
# 1	Bright
# 2	Dim
# 4	Underscore	
# 5	Blink
# 7	Reverse
# 8	Hidden

# 	Foreground Colours
# 30	Black
# 31	Red
# 32	Green
# 33	Yellow
# 34	Blue
# 35	Magenta
# 36	Cyan
# 37	White

# 	Background Colours
# 40	Black
# 41	Red
# 42	Green
# 43	Yellow
# 44	Blue
# 45	Magenta
# 46	Cyan
# 47	White

[[ "${TERM}${TERMCAP}" =~ dumb || "${TERM}${TERMCAP}" =~ emacs  ]]  || 
eval "bl='\[\033[01;34m\]' gr='\[\033[01;32m\]' yl='\[\033[01;33m\]'  rv='\[\033[01;7m\]'   rd='\[\033[01;31m\]'   z0='\[\033[00m\]'"

PS1="${yl}#${bl}\!${rd}"${nil}"\\$"${nil}"${bl}\#${gr} \D{%a} \D{%y}${rv}\D{%m%d}${z0}${gr}\t${bl} ${yl}\u@\h:${rd}\w\n${z0}${yl}:${z0} "
unset bl gr z0 yl rv rd 
PS2='> '
PS4='+ ' 
export EDITOR=vim VISUAL=vim

x () { 
    eval TERM=xterm xterm -cr red -s -rightbar -sl 10000 -sb -bg black -fg gray80 -ms red -hc purple -ls -e ${SHELL} -l ${@:+ -c }${@:- '-i'  }  &
    disown
}
alias vi=vim  
if [[ ${OSTYPE} =~ darwin ]] 
then
    alias emacs='open -n  -a ~/Applications/Emacs.app/Contents/MacOS/Emacs'
fi

{ 
    [[ $(type -p gls) ]] && 
    alias ls='gls --color=auto'
    
}  ||
[[ "$OSTYPE" =~ gnu ]] &&
alias ouch='eval tset -s'
