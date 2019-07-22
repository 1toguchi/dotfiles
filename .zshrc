DOTFILE_DIR=$HOME/dotfiles
VIM_PLUGIN_DIR=$DOTFILE_DIR/.vim/pack/mypackage/start



# theme is written in this file
for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
do
	source "$f"
done

st

export TERM="xterm-256color"
export PATH=$PATH:$HOME/.local/bin/
source $DOTFILE_DIR/.zshrc.antigen
source $DOTFILE_DIR/.zsh

export PATH=$HOME/.nodebrew/current/bin:$PATH

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


function atc () {
  $HOME/.local/bin/atcoder-tools
}


#--------------------------------

#function google() {                                                                                                                                                                           
#  local str opt 
#  if [ $# != 0 ]; then
#      str="$@"
#      for i in $*; do
#      str="$str+$i"
#      done
#      str=`echo $str | sed 's/^\+//'`
#      opt='search?num=50&hl=ja&lr=lang_ja'
#      opt="${opt}&q=${str}"
#  fi
#  vim -c "W3m google $str"
#}


#--------------------------------
# tmux 
#--------------------------------
# 初期に用意されているセッション
# "prefix -> (" or "prefix -> )" でセッション切り替え
TMUX_INITIAL_SESSIONS=(
"config"
"works"
"personal"
)

# 初期セッションが存在していなかったらバックグラウンドで作る
for tmux_session in ${TMUX_INITIAL_SESSIONS[@]}
do
  if ! $(tmux has-session -t ${tmux_session} 2> /dev/null)
  then
    tmux new-session -d -s ${tmux_session}
  fi
done

# tmux が起動中でなければ attach する
if [ -z "$TMUX" ]
then
  tmux attach-session -t "${TMUX_INITIAL_SESSIONS[0]}"
else
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
