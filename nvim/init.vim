:let mapleader = " "

syntax enable 
call plug#begin('~/.config/nvim/plugged')

" Utility
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'foosoft/vim-argwrap'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

" Autocomplete / LSP
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Search
Plug 'henrik/vim-indexed-search'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colors
Plug 'morhetz/gruvbox'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'walm/jshint.vim'

" Tests
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'

" Display
Plug 'bling/vim-airline'
Plug 'vim-scripts/file-line'

" HTML
Plug 'gregsexton/MatchTag'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'

call plug#end()

au BufRead,BufNewFile {COMMIT_EDITMSG}                                         set ft=gitcommit
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,Guardfile,*.rake,config.ru}    set ft=ruby
syntax on
filetype plugin indent on

set autoindent
set background=light
set backspace=indent,eol,start
set clipboard=unnamed
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
set modeline
set modelines=1
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set nu
set number
set relativenumber
set ruler
set shiftwidth=2
set shortmess+=c
set showcmd
set showmatch
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=2
set statusline^=coc-status-airline
set tabstop=2
set textwidth=0
set updatetime=1000
set wildmenu
set wildmode=longest,list

hi MatchParen cterm=none ctermbg=green ctermfg=blue

" nerdtree toggle
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * wincmd p
map <Leader>l :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <Leader>f :NERDTreeFind<CR>

" for crontab editing
set backupskip=/tmp/*,/private/tmp/*"

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

" Start Interactive EasyAlign in visual mode
vmap <ENTER> <Plug>(EasyAlign)

let g:bufferline_echo = 0

" Multiple Cursors
let g:multi_cursor_quit_key='<C-d>'

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" vim-test
let test#strategy = "vimux"
let g:test#preserve_screen = 1
let g:VimuxHeight = "33"
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

" AutoComplete
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:airline#extensions#coc#enabled = 1

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --vimgrep --no-ignore-vcs'
nnoremap <silent> <C-p> :Files<CR>
nnoremap K :Rg <C-R><C-W><CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Arg Wrap
nmap <Leader>a :ArgWrap<CR>

" Resize Windows
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map { <C-W><
  map } <C-W>>
endif

" No Arrow Keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

vnoremap // y/<C-R>"<CR>
vnoremap <C-c> "*y
nmap <Leader>n :execute ":set nu!"<CR>
nmap <Leader>N :execute ":set invnumber invrelativenumber"<CR>
nmap <Leader>g :execute "GitGutterToggle"<CR>
nnoremap <silent> Y :execute "noh"<CR>
imap <C-i> <ESC>
xnoremap p pgvy
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Colorscheme settings
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark
