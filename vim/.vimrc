" Colors
if (has("termguicolors"))
  set termguicolors                   " 24-bit (true-color) mode outside tmux
endif

syntax enable
autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'css', 'ruby', 'javascript', 'bash=sh']
set background=dark
colorscheme onedark

" Spaces, Tabs, Screen Text Formatting
set wrap                              " allow visual line wrapping
set textwidth=0                       " disable auto new line
set wrapmargin=0                      " disable EOL at wrap
set expandtab                         " <TAB> insert softtabstop # spaces
set shiftwidth=2                      " spaces for autoindent, >>, <<, ==
set softtabstop=2                     " spaces per <TAB>, <BS>
set tabstop=2                         " spaces per read <TAB>
set autoindent                        " new line copies previous line indent
filetype plugin indent on             " indent by filetype
set list                              " display invisible chars
set listchars=tab:>-,space:·,eol:¬,trail:+ " whitespace chars
set linebreak                         " visual wrap at breakat chars
set showbreak=--

" Paste
set pastetoggle=<F2>                  " toggle pasting via terminal clipboard

" UI
set number
set relativenumber
set showcmd                           " show command in bottom bar
set ruler                             " show current position in bottom bar
set cursorline                        " highlight current line
autocmd InsertEnter,InsertLeave * set cursorline! " toggle cursorline
set colorcolumn=81
" let &colorcolumn=join(range(81,335),',') " set range for colorcolumn

" Text Search
set showmatch                         " highlight matching parens
set hlsearch                          " highlight all search matches
set incsearch                         " incremental highlight search matches

" Files and Buffers
set hidden                            " prevent unloading abandoned buffers
set path+=**                          " search into subdirs
set wildmenu
set wildmode=longest:full,full

" Key Remapping
inoremap jj <ESC>
"
" Leader Mappings
let mapleader = "\<space>"
nnoremap <leader><space> :nohl<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


