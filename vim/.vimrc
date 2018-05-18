" Colors
if (has("termguicolors"))
  set termguicolors                   " 24-bit (true-color) mode outside tmux
endif

syntax enable

augroup filetype_recongnition
  autocmd!
  autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.git{,modules/**/,worktrees/*/}{COMMIT_EDIT,TAG_EDIT,MERGE_,}MSG set filetype=gitcommit
augroup END

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

augroup git_messages
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=72
augroup END

" Paste
set pastetoggle=<F2>                  " toggle pasting via terminal clipboard

" UI
set number
set relativenumber
set showcmd                           " show command in bottom bar
set ruler                             " show current position in bottom bar
set cursorline                        " highlight current line

augroup cursor_line_toggle
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!
augroup END

set colorcolumn=81

" Text Search
set showmatch                         " highlight matching parens
set hlsearch                          " highlight all search matches
set incsearch                         " incremental highlight search matches

" Files and Buffers
set hidden                            " prevent unloading abandoned buffers
set path+=**                          " search into subdirs
set wildmenu
set wildmode=longest:full,full

" KEY REMAPPINGS
inoremap jj <esc>

" Leader Mappings
let mapleader = "\<space>"
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Local Leader Mappings
let maplocalleader = "\<bs>"

augroup file_type_mappings
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>C I//<esc>
  autocmd FileType javascript nnoremap <buffer> <localleader>DC 0f/diw
  autocmd FileType javascript nnoremap <buffer> <localleader>c A//
  autocmd FileType javascript nnoremap <buffer> <localleader>dc $?//<cr>:nohlsearch<cr>d$g_ld$
augroup END

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

