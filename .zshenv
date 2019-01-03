DOTFILE_DIR=$HOME/dotfiles
source $DOTFILE_DIR/.zsh/powerlevel9k/powerlevel9k.zsh-theme

export TERM="xterm-256color"

# PATH の設定（お好みで）
export PATH="/usr/local/bin:$PATH"

# PATH の内容と同期している配列変数 path も使える
path=(
    ~/bin
    $path
)

export TERM="xterm-256color"
