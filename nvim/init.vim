" Leader
:let mapleader = " "
syntax enable

"============================
" BASIC EDITING CONFIGURATION
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"fuzzy finding
Plug 'junegunn/fzf'

" Utility
Plug 'henrik/vim-indexed-search'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'kana/vim-textobj-user'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'mcasper/vim-infer-debugger'
Plug 'unblevable/quick-scope'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Colors
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
let g:alchemist_tag_disable = 1

Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'

" Liquid (Shopify)
Plug 'tpope/vim-liquid'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'ngmy/vim-rubocop'
Plug 'jgdavey/tslime.vim'
Plug 'sunaku/vim-ruby-minitest'

" Javascript
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'walm/jshint.vim'
Plug 'vim-scripts/jQuery'
Plug 'mxw/vim-jsx'

" Tests
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

" Airline
Plug 'bling/vim-airline'
Plug 'vim-scripts/file-line'

" HTML
Plug 'gregsexton/MatchTag'
Plug 'mattn/emmet-vim'

call plug#end()

au BufRead,BufNewFile {COMMIT_EDITMSG}                                         set ft=gitcommit
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,Guardfile,*.rake,config.ru}    set ft=ruby
syntax on
filetype plugin indent on
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
set clipboard=unnamed

" Indexed Search
let g:indexed_search_colors = 0

" Speed
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

" ctags
set tags=./tags,tags;$HOME
map <A-[> :tab split<CR>:exec("tag ".expand(<cword>))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand(<cword>))<CR>

"Start Interactive EasyAlign in visual mode
vmap <ENTER> <Plug>(EasyAlign)
"Start Interactive EasyAlign with a Vim movement
nmap <leader>a <Plug>(EasyAlign)

let g:bufferline_echo = 0

" Debugger
nmap <Leader>b :call AddDebugger("O")<cr>
nmap <Leader>b :call AddDebugger("o")<cr>
nmap <Leader>d :call RemoveAllDebuggers()<cr>

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Auto Complete
let g:deoplete#enable_at_startup = 1

" vim-test
let test#strategy = "vimux"
let g:test#preserve_screen = 1
let g:VimuxHeight = "30"
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

" Mappings
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map { <C-W><
  map } <C-W>>
endif
vnoremap <C-c> "*y
nmap <Leader>n :execute ":set nu!"<CR>
nmap <Leader>g :execute "GitGutterToggle"<CR>
nnoremap <silent> Y :execute "noh"<CR>
nnoremap <silent> <C-p> :FZF<CR>
imap <leader>jj <Esc> 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
xnoremap p pgvy
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
map <Leader>gb :Gblame<CR>

" Colorscheme settings
colorscheme desert
