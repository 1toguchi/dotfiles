inoremap <silent> jj <ESC>

set clipboard=unnamedplus

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
set runtimepath+=~/dotfiles/.vim/plugged/vim-plug

if has('vim_starting')
  set rtp+=/home/yuu/dotfiles/.vim/plugged/vim-plug
  if !isdirectory(expand("~/dotfiles/.vim/plugged/vim-plug"))
    echo 'install vim-plug...'
    call system("mkdir -p ~/dotfiles/.vim/plugged/vim-plug")
    call system("git clone https://github.com/junegunn/vim-plug.git ~/dotfiles/.vim/plugged/vim-plug/autoload")
  end
endif

call plug#begin("~/dotfiles/.vim/plugged")

Plug 'junegunn/fzf', { 'dir': '~/dotfiles/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"<leader> + ? = \?
Plug 'lifepillar/vim-cheat40'

Plug 'miyakogi/seiya.vim'
Plug 'itchyny/lightline.vim', {'do': 'cp colors/* ~/dotfiles/.vim/colors/'}
Plug 'altercation/vim-colors-solarized', {'do': 'cp colors/* ~/dotfiles/.vim/colors/'}
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-jp/vimdoc-ja'
Plug 'ryanoasis/powerline-extra-symbols'
Plug 'ryanoasis/vim-devicons'
Plug 'plasticboy/vim-markdown'
Plug 'OrangeT/vim-csharp'
Plug 'Shougo/neosnippet.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'OmniSharp/omnisharp-vim', {
\   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
\   'build': {
\     'windows' : 'msbuild server/OmniSharp.sln',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   },
\ }
Plug 'tpope/vim-dispatch'
Plug 'Shougo/vimproc.vim'

let g:OmniSharp_server_use_mono = 1
"sudo apt-get install libuv1-dev

Plug 'OmniSharp/omnisharp-roslyn'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neocomplcache.vim' 


autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'




"###############################################
" QuickRun
" \r
Plug 'thinca/vim-quickrun'
let g:quickrun_config = { }
let g:quickrun_config['cs']  = {
	\ 'command'              : 'csc',
	\ 'exec'                 : ['%c %o %s:p > /dev/null', 'mono %s:p:r.exe', 'rm %s:p:r.exe'],
	\ 'cmdopt'               : '-warn:4',
	\ 'quickfix/errorformat' : '%f\\(%l\\,%c\\):\ error\ CS%n:\ %m',
  \ 'outputter/buffer/split': '10',
  \ "outputter/buffer/into" : 1,
\ }

filetype plugin indent on
"###############################################


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


"###############################################
"# NerdTree
"###############################################

Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

"###############################################
"# syntastic settings
"###############################################

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#end()


"###############################################
"# Appearance
"###############################################

cabbrev ggr W3m google
cabbrev H W3m#back
cabbrev yyp W3m#CopyUrl

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


"###############################################
"# Simplenote setting
"###############################################
Plug 'mrtazz/simplenote.vim'
source ~/.simplenoterc
let g:SimplenoteFiletype = "markdown"
let g:SimplenoteVertical = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1



