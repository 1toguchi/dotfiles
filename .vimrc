inoremap <silent> jj <ESC>

set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

"################################################
"# vim-plugin Do :PlugInstall in vim
"################################################
" 設定されたランタイムパスの確認
set runtimepath+=~/dotfiles/.vim/plugged/vim-plug

if has('vim_starting')
  set rtp+=/home/yuu/dotfiles/.vim/plugged/vim-plug
  if !isdirectory(expand("/home/yuu/dotfiles/.vim/plugged/vim-plug"))
    echo 'install vim-plug...'
    call system("mkdir -p /home/yuu/dotfiles/.vim/plugged/vim-plug")
    call system("git clone https://github.com/junegunn/vim-plug.git /home/yuu/dotfiles/.vim/plugged/vim-plug/autoload")
  end
endif

call plug#begin("/home/yuu/dotfiles/.vim/plugged")

Plug 'junegunn/fzf', { 'dir': '~/dotfiles/.fzf', 'do': './install --all' }
Plug 'suan/vim-instant-markdown'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-cheat40'
Plug 'miyakogi/seiya.vim'
Plug 'itchyny/lightline.vim', {'do': 'cp colors/* ~/dotfiles/.vim/colors/'}
Plug 'altercation/vim-colors-solarized', {'do': 'cp colors/* ~/dotfiles/.vim/colors/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/powerline-extra-symbols'
Plug 'ryanoasis/vim-devicons'
Plug 'plasticboy/vim-markdown'
Plug 'yuratomo/w3m.vim'

call plug#end()

"###############################################
"# Appearance
"###############################################

cabbrev ggr W3m google

autocmd ColorScheme * highlight Comment ctermfg=248
autocmd ColorScheme * highlight LineNr ctermfg=8
syntax enable
colorscheme solarized
set background=dark
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

let g:airline_solarized_bg='dark'
let g:airline_theme = 'murmur'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:seiya_auto_enable=1
