"read Vim Keymap 

source ~/dotfiles/.vimrc.keymap


"###############################################
"# Compile
"###############################################

function! Run()
  :!rm ./hoge -f
  :!cd
  :w
  :gcc -o % % -lstdc++
  :!./%
endfunction

command! Gcc call Run()
nnoremap <F5> :Gcc<CR><CR>

"################################################
"# vim-plugin Do :PlugInstall in vim
"################################################
set runtimepath+=~/dotfiles/.vim/plugged/vim-plug

if has('vim_starting')
  set rtp+=$HOME/dotfiles/.vim/plugged/vim-plug
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

" Use deoplete.
let g:deoplete#enable_at_startup = 1



