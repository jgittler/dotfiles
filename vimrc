" Leader
:let mapleader = " "

" Colorscheme settings
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='hard'

"============================
" BASIC EDITING CONFIGURATION
call plug#begin('~/.vim/bundle')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

" Utility
Plug 'henrik/vim-indexed-search'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'kana/vim-textobj-user'
Plug 'Valloric/YouCompleteMe'
Plug 'snipMate'
Plug 'ConradIrwin/vim-bracketed-paste'

" Colors
Plug 'ajh17/Spacegray.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ChrisKempson/Vim-Tomorrow-Theme'
Plug 'morhetz/gruvbox'
Plug 'Keithbsmiley/rspec.vim'
Plug 'sjl/badwolf'
Plug 'jpo/vim-railscasts-theme'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'gilgigilgil/anderson.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'ngmy/vim-rubocop'
Plug 'jgdavey/tslime.vim'

" Javascript
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'walm/jshint.vim'
Plug 'jQuery'
Plug 'mxw/vim-jsx'
Plug 'vim-jsx'

" AIRLINE
Plug 'bling/vim-airline'
Plug 'file-line'

" HTML
Plug 'gregsexton/MatchTag'
call plug#end()

au BufRead,BufNewFile {COMMIT_EDITMSG}                                         set ft=gitcommit
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,Guardfile,*.rake,config.ru}    set ft=ruby
syntax on
filetype plugin indent on
set nocompatible
set autoindent
set backspace=indent,eol,start
set background=light
set encoding=utf-8
set expandtab
set foldenable
set foldlevel=100
set foldmethod=marker
set foldopen=block,hor,mark,percent,quickfix,tag
set formatoptions-=or
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchtime=5
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nu
set ruler
set shiftwidth=2
set showcmd
set showmatch
hi MatchParen cterm=none ctermbg=green ctermfg=blue
set smartcase
set smarttab
set softtabstop=2
set tabstop=2
set textwidth=0
set wildmenu
set wildmode=longest,list
set number
set modeline
set modelines=1

" Indexed Search
let g:indexed_search_colors = 0

"SPEEEEEEEEEEEEEED
set re=1

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ctags stuff i don't understand
map <A-[> :tab split<CR>:exec("tag ".expand(<cword>))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand(<cword>))<CR>
"Start Interactive EasyAlign in visual mode
vmap <ENTER> <Plug>(EasyAlign)
"Start Interactive EasyAlign with a Vim movement
nmap <leader>a <Plug>(EasyAlign)

let g:bufferline_echo = 0

" Ctrl-P Settings
"
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ -U
  let g:ctrlp_user_command = 'ag %s -Ul --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif

if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Mappings
nnoremap <silent> Y :execute "noh"<CR>
" nnoremap <silent> <C-p> :execute "FZF"<CR>
imap <leader>j <Esc> 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
xnoremap p pgvy
