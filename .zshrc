DOTFILE_DIR=$HOME/dotfiles
VIM_PLUGIN_DIR=$DOTFILE_DIR/.vim/pack/plugged


# 環境変数
export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=30000
SAVEHIST=30000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# プラグインを有効化
#source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='%T %~ %F{magenta}$%f '
RPROMPT='${vcs_info_msg_0_}'

# alias
alias vv=$'vim $DOTFILE_DIR/.vimrc'
alias vz=$'vim $DOTFILE_DIR/.zshrc'
alias ls='ls -aF'
alias ll='ls -l'
alias la='ls -al'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# theme is written in this file
#for f in $DOTFILE_DIR/.zsh/[0-9]*.(sh|zsh)
#do
#	source "$f"
#done


#source $DOTFILE_DIR/.zsh/10_aliases.zsh
#source $DOTFILE_DIR/.zsh
#export PATH=$PATH:$HOME/.local/bin/

#################################
# function
#################################

#function extract() {
#  case $1 in
#    *.tar.gz|*.tgz) tar xzvf $1;;
#    *.tar.xz) tar Jxvf $1;;
#    *.zip) unzip $1;;
#    *.lzh) lha e $1;;
#    *.tar.bz2|*.tbz) tar xjvf $1;;
#    *.tar.Z) tar zxvf $1;;
#    *.gz) gzip -d $1;;
#    *.bz2) bzip2 -dc $1;;
#    *.Z) uncompress $1;;
#    *.tar) tar xvf $1;;
#    *.arj) unarj $1;;
#  esac
#}
#alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

#--------------------------------

#function peco-src () {
#  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
#  if [ -n "$selected_dir" ]; then
#    BUFFER="cd ${selected_dir}"
#    zle accept-line
#  fi
#  zle clear-screen
#}
#zle -N peco-src
#bindkey '^g' peco-src
#
#
#function atc () {
#  $HOME/.local/bin/atcoder-tools
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
#if [ -z "$TMUX" ]
#then
#  tmux attach-session -t "${TMUX_INITIAL_SESSIONS[0]}"
#else
#fi
