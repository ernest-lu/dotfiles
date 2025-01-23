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
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'pondrejk/vim-readability'
Plug 'tikhomirov/vim-glsl'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/bnf.vim'
"Plug 'github/copilot.vim'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'EgZvor/vim-black'
Plug 'justmao945/vim-clang'
Plug 'markvincze/panda-vim'
Plug 'williamboman/mason.nvim'
Plug 'lervag/vimtex'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()
autocmd BufRead *.py setlocal colorcolumn=0

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

let g:material_theme_style = 'darker'
set backspace=indent,eol,start
set rtp^="/Users/ernest/.opam/default/share/ocp-indent/vim"
set t_Co=256  
"set background=dark
"colorscheme PaperColor
"colorscheme material
"colorscheme gruvbox
colorscheme panda

set pumheight=15  " Limit popup menu height to 15 lines


let g:python3_host_prog="/opt/homebrew/anaconda3/bin/python3"
" Autoformat configuration
noremap <leader>a :Autoformat<CR>
" Enable automatic formatting on save for specific filetypes
autocmd BufWritePre *.py,*.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.html,*.json,*.c,*.cpp,*.h,*.hpp,*.rs :Autoformat

" Configure formatters (examples for common languages)
let g:formatters_python = ['black']
let g:formatters_javascript = ['prettier']
let g:formatters_typescript = ['prettier']
let g:formatters_css = ['prettier']
let g:formatters_html = ['prettier']
let g:formatters_json = ['prettier']
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
let g:formatters_cpp = ['clangformat']
let g:formatters_c = ['clangformat']

" Enable Rust formatting with rust.vim
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Disable fallback to vim's indent file
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" CoC configuration
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Build and Run shortcuts
" F9 to build/make
nnoremap <F9> :vsplit input.txt<CR>:vertical resize 40<CR>
" F10 to open output in new vertical split
nnoremap <F10> :vertical terminal ./build.sh<CR>:vertical resize 60<CR>:startinsert<CR>
nnoremap <F11> :vertical terminal <CR>

set modifiable  " Allow buffer modifications
