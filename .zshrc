DOTFILE_DIR=$HOME/dotfiles

# theme is written in this file
for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
do
	source "$f"
done

export TERM="xterm-256color"
source $DOTFILE_DIR/.zshrc.antigen
source $DOTFILE_DIR/.zsh

# tmux_automatically_attach attachs tmux session
# automatically when your are in zsh
if [[ -x ~/bin/tmuxx ]]; then
    ./bin/tmuxx
fi

#################################
# function
#################################


function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
