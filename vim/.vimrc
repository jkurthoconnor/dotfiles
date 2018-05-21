" SETTINGS / OPTIONS
" ==================

filetype plugin indent on             " filetype detection, ft indent and plugins

augroup filetype_recongnition
  autocmd!
  autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.git{,modules/**/,worktrees/*/}{COMMIT_EDIT,TAG_EDIT,MERGE_,}MSG set filetype=gitcommit
augroup END

let g:markdown_fenced_languages = ['html', 'css', 'ruby', 'javascript', 'bash=sh']

" Colors
if (has("termguicolors"))
  set termguicolors                   " 24-bit (true-color) mode outside tmux
endif

syntax enable
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
set list                              " display invisible chars
set listchars=tab:>-,space:·,eol:¬,trail:+ " whitespace chars
set linebreak                         " visual wrap at breakat chars
set showbreak=--
set colorcolumn=80

augroup git_messages
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal colorcolumn=72
augroup END

" Paste
set pastetoggle=<F2>                  " toggle pasting via terminal clipboard

" UI
set number
set relativenumber
set cursorline                        " highlight current line

augroup cursor_line_toggle
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!
augroup END

set showcmd                           " show command in bottom bar
set statusline=%f                     " path
set statusline+=%=                    " switch to right side
set statusline+=%l                    " line
set statusline+=/                     " separator
set statusline+=%L                    " total lines

" Text Search
set showmatch                         " highlight matching parens
set hlsearch                          " highlight all search matches
set incsearch                         " incremental highlight search matches

" Files and Buffers
set hidden                            " prevent unloading abandoned buffers
set path+=**                          " search into subdirs
set wildmenu
set wildmode=longest:full,full

" MAPPINGS
" ========

inoremap jj <esc>

" pairs
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Leader Mappings
let mapleader = "\<space>"
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>l :ls<cr>:b<space>

" Local Leader Mappings
let maplocalleader = "\<bs>"

augroup file_type_mappings
  autocmd!
  " commenting
  autocmd FileType javascript nnoremap <buffer> <localleader>C I//<esc>
  autocmd FileType javascript nnoremap <buffer> <localleader>c A//
  " uncommenting
  autocmd FileType javascript nnoremap <buffer> <localleader>dC 0f/diw
  autocmd FileType javascript nnoremap <buffer> <localleader>dc $?//<cr>:nohlsearch<cr>d$g_ld$
augroup END


" ABBREVIATIONS
" =============

augroup markdown_snippets
  autocmd!
  " code fencing
  autocmd FileType markdown :iabbrev <buffer> jfn ```javascript
        \<cr>```<esc><s-o>
  autocmd FileType markdown :iabbrev <buffer> rfn ```ruby
        \<cr>```<esc><s-o>
  autocmd FileType markdown :iabbrev <buffer> cfn ```css
        \<cr>```<esc><s-o>
  autocmd FileType markdown :iabbrev <buffer> hfn ```html
        \<cr>```<esc><s-o>
  " p-set templates
  autocmd FileType markdown :iabbrev <buffer> ph1 # LS Exercises: []()<left><esc>
  autocmd FileType markdown :iabbrev <buffer> ph2 ## Problem:<esc>
  autocmd FileType markdown :iabbrev <buffer> ph2 ### Solution:<esc>
augroup END

augroup javascript_snippets
  autocmd!
  autocmd FileType javascript :iabbrev <buffer> func function ()<left>
" autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END
