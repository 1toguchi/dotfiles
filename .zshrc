DOTFILE_DIR=$HOME/dotfiles
VIM_PLUGIN_DIR=$DOTFILE_DIR/.vim/pack/mypackage/start

# theme is written in this file
for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
do
	source "$f"
done

st

export TERM="xterm-256color"
source $DOTFILE_DIR/.zshrc.antigen
source $DOTFILE_DIR/.zsh

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

#--------------------------------

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src

#--------------------------------

function google() {                                                                                                                                                                           
  local str opt 
  if [ $# != 0 ]; then
      str="$@"
      #for i in $*; do
      #str="$str+$i"
      #done
      #str=`echo $str | sed 's/^\+//'`
      #opt='search?num=50&hl=ja&lr=lang_ja'
      #opt="${opt}&q=${str}"
  fi
  vim -c "W3m google $str"
}

export TMUX_TMPDIR=/tmp

tmux set-option prefix C-t
tmux  unbind-key C-b && tmux set-option -g prefix C-j && tmux bind-key C-j send-prefix
#[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux source-file "$DOTFILE_DIR/.tmux.conf"

