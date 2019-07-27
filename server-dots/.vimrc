" LIGHT CONFIG FOR SERVERS
"
" ==========================
" GENERAL SETTINGS & OPTIONS
" ==========================

filetype plugin indent on             " filetype detection, ft indent and plugins

" COLORS & SYNTAX
if (has("termguicolors"))
  set termguicolors                   " 24-bit (true-color) mode outside tmux
endif

syntax enable
colorscheme slate
set background=dark

" SPACES, TABS, SCREEN TEXT FORMATTING
set wrap                              " allow visual line wrapping
set textwidth=0                       " disable auto new line
set wrapmargin=0                      " disable EOL at wrap
set expandtab                         " <TAB> insert softtabstop # spaces
set shiftwidth=2                      " spaces for autoindent, >>, <<, ==
set softtabstop=2                     " spaces per <TAB>, <BS>
set tabstop=2                         " spaces per read <TAB>
set autoindent                        " new line copies previous line indent
set list                              " display invisible chars
set listchars=tab:>-,space:·,eol:¬,trail:+ " whitespace chars
set linebreak                         " visual wrap at breakat chars
set showbreak=--
set colorcolumn=80


" PASTE
set pastetoggle=<F2>                  " toggle pasting via terminal clipboard

" UI
set number
set relativenumber
set cursorline                        " highlight current line

augroup cursor_line_toggle
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!
augroup END

" TEXT SEARCH
set showmatch                         " highlight matching parens
set hlsearch
set incsearch                         " incremental highlight search matches

" FILES AND BUFFERS
set hidden                            " prevent unloading abandoned buffers
set path+=**                          " search into subdirs
set wildmenu
set wildmode=longest:full,full

" MAPPINGS
" ========
inoremap jk <esc>

" MOVEMENT  (real lines if count is given, else visual lines)
noremap <expr> j (v:count ? 'j' : 'gj')
noremap <expr> k (v:count ? 'k' : 'gk')

" WINDOW NAVIGATION
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" LEADER MAPPINGS
let mapleader = "\<space>"
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>l :ls<cr>:b<space>

