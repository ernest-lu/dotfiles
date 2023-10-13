set ttimeout
set ttimeoutlen=1
set ttyfast
syntax on
set mouse=a
set shiftwidth=2
set tabstop=2
set nu
set breakindent
set cursorline
set splitbelow
set hlsearch
set relativenumber

let mapleader=" "
call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'bfrg/vim-cpp-modern'
Plug 'chiel92/vim-autoformat'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kaicataldo/material.vim'
Plug 'lithammer/nvim-pylance'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'pondrejk/vim-readability'
Plug 'tikhomirov/vim-glsl'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/bnf.vim'
Plug 'github/copilot.vim'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'EgZvor/vim-black'
Plug 'justmao945/vim-clang'
Plug 'markvincze/panda-vim'
Plug 'williamboman/mason.nvim'

call plug#end()
autocmd BufRead *.py setlocal colorcolumn=0
let g:pymode = 1

set updatetime=100

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

if (has('termguicolors'))
	set termguicolors
endif

func! WordProcessor()
  map j gj
  map k gk
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  setlocal spell spelllang=en_us
  set thesaurus+=/Users/ernest/.vim/mthesaur.txt
  set complete+=s
endfu
com! WP call WordProcessor()

nnoremap <leader>f :Files<CR>

let g:python_highlight_all = 1
let g:material_theme_style = 'darker'
let g:python_highlight_space_errors = 0
set backspace=indent,eol,start
set t_Co=256  
"set background=dark
"colorscheme PaperColor
"colorscheme material
"colorscheme gruvbox
colorscheme panda


