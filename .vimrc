"read Vim Keymap 
source ~/dotfiles/.vimrc.keymap 
set wildmenu
set wildmode=full

"set helplang=ja,en

"To run vim-plug :PlugInstall

set runtimepath+=$HOME/dotfiles/.vim/plugged/vim-plug

if has('vim_starting')
  set rtp+=$HOME/dotfiles/.vim/plugged/vim-plug
  if !isdirectory(expand("~/dotfiles/.vim/plugged/vim-plug"))
    echo 'install vim-plug...'
    call system("mkdir -p ~/dotfiles/.vim/plugged/vim-plug")
    call system("git clone https://github.com/junegunn/vim-plug.git ~/dotfiles/.vim/plugged/vim-plug/autoload")
  end
endif

call plug#begin("~/dotfiles/.vim/plugged")

"<leader> + ? = \?

"Plug 'altercation/vim-colors-solarized', {'do': 'cp colors/* ~/dotfiles/.vim/colors/'}
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-jp/vimdoc-ja'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"###############################################
" QuickRun
" \r
Plug 'thinca/vim-quickrun'

filetype plugin indent on
"###############################################
" Dash app

Plug 'rizzatti/dash.vim'

"###############################################

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:neosnippet#snippets_directory='~/dotfiles/.vim/snippets'

"###############################################
"# NerdTree <C-n>
"###############################################

Plug 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

"###############################################
"# syntastic settings
"###############################################

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call plug#end()

"###############################################
"# Appearance
"###############################################

autocmd ColorScheme * highlight Comment ctermfg=248
autocmd ColorScheme * highlight LineNr ctermfg=8
syntax enable
colorscheme solarized
set background=dark
set encoding=UTF-8
"set guifont=DroidSansMono\ Nerd\ Font\ 11

let g:airline_solarized_bg='dark'
let g:airline_theme = 'murmur'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:seiya_auto_enable=1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

