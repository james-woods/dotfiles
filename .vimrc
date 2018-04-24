" tell vim that my iTerm Terminal is capable of 256 colors even when running
" inside tmux
set t_Co=256

set nocompatible

" Initialize plug-vim plugin manager
call plug#begin()
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go'
Plug 'google/yapf'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'scrooloose/nerdcommenter'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
call plug#end()

" Initialize Pathogen
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Colorscheme see https://github.com/hukl/Smyck-Color-Scheme
color smyck

" Add line numbers
set number
set ruler

" Set encoding
set encoding=utf-8

" netrw preview setting
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30

" Whitespace stuff
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" verbose mode
let g:autoformat_verbosemode=1

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»·,trail:·

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Map F3 to reindent highlighted text
noremap <F3> :Autoformat<CR>

" Highlight characters behind the 80 chars margin
:au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" Disable code folding
set nofoldenable

" Directories for swp files
set backupdir=~/.vimbackup
set directory=~/.vimbackup

" NERDTree configuration
" let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
" map <Leader>n :NERDTreeToggle<CR>

" ale configuration for python
let g:ale_fixers = {'python': ['isort', 'yapf']}
let g:ale_fix_on_save = 1

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Disable Jedi Autocomplete
let g:jedi#completions_enabled = 0

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
"au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }

" remap arrow keys to nothing to force using hjkl for movement
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" status line fun
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

