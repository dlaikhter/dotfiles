source ~/.git-prompt.sh

PS1="\t \[\033[32m\]\u \[\033[0;35m\]\w\[\033[1;31m\]\$(__git_ps1)\[\033[30m\]$ \[\033[0m\]"

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias yescat='yes $(eval printf "\#%.0s" '{1..'"${COLUMNS:-$(tput cols)}"\}; echo) | lolcat'
alias genYCM='~/.vim/bundle/YCM-Generator/config_gen.py .'
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
