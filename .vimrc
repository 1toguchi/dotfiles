"read Vim Keymap 
"<leader> = \ = <Space>>
source ~/dotfiles/.vimrc.keymap 
set wildmenu
set wildmode=full

set helplang=ja,en


"To run vim-plug :PlugInstall
set runtimepath+=~/dotfiles/.vim/plugged/vim-plug

if has('vim_starting')
  set rtp+=~/dotfiles/.vim/plugged/vim-plug
  if !isdirectory(expand("~/dotfiles/.vim/plugged/vim-plug"))
    echo 'install vim-plug...'
    call system("mkdir -p ~/dotfiles/.vim/plugged/vim-plug")
    call system("git clone https://github.com/junegunn/vim-plug.git ~/dotfiles/.vim/plugged/vim-plug/autoload")
  end
endif

call plug#begin("~/dotfiles/.vim/plugged")

Plug 'altercation/vim-colors-solarized', {'do': 'cp colors/* ~/dotfiles/.vim/colors/'}
Plug 'tyrannicaltoucan/vim-quantum', {'do': 'cp colors/* ~/dotfiles/.vim/colors/'}

Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-jp/vimdoc-ja'

"############################################
" deoplete
" ###########################################

"
"ここからdeoplete本体
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

let g:deoplete#enable_at_startup = 1
"ここまでdeoplete本体

"pythonの自動補完プラグイン（任意）
Plug 'deoplete-plugins/deoplete-jedi'

"Vim用自動補完プラグイン（任意）
Plug 'Shougo/neco-vim'
"
"###############################################
" QuickRun
" \r = <Space>r
Plug 'thinca/vim-quickrun'

filetype plugin indent on
"###############################################



"###############################################
"# NerdTree <C-n>
"###############################################

Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

"###############################################
"# syntastic settings
"###############################################

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"###############################################
"# Appearance
"###############################################

autocmd ColorScheme * highlight Comment ctermfg=248
autocmd ColorScheme * highlight LineNr ctermfg=8
syntax enable
let g:airline#extentions#tabline#enabled = 1

let g:solarized_termcolors=256
let g:airline_theme = 'quantum'
set background=dark
set encoding=UTF-8

syntax enable
set background=dark
colorscheme solarized
"colorscheme quantum

call plug#end()
