" PACKAGE MANAGEMENT
" ================
" `:call minpac#update()` to update || install plugins registered below
" `:call minpac#clean()` to uninstall && remove minpac-managed plugins no
" longer registered below
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', { 'type': 'opt' })

call minpac#add('junegunn/fzf')
call minpac#add('mattn/emmet-vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-surround')

" syntax
call minpac#add('MTDL9/vim-log-highlighting')
call minpac#add('PotatoesMaster/i3-vim-syntax')
call minpac#add('cakebaker/scss-syntax.vim')
call minpac#add('chr4/nginx.vim')
call minpac#add('ekalinin/dockerfile.vim')
call minpac#add('godlygeek/tabular')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('mxw/vim-jsx')
call minpac#add('pangloss/vim-javascript')
call minpac#add('preservim/vim-markdown')
call minpac#add('stephpy/vim-yaml')
call minpac#add('towolf/vim-helm')

" aesthetics
call minpac#add('morhetz/gruvbox', { 'type': 'opt'})
call minpac#add('rakr/vim-one', { 'type': 'opt'})
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" load desired `opt` plugins
packadd gruvbox

" PLUGIN-SPECIFIC SETTINGS
" gruvbox
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_invert_selection=0
let g:gruvbox_hls_cursor='green'
let g:gruvbox_improved_strings=0

" emmet
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings={'javascript.jsx' : { 'extends' : 'jsx' }}

augroup emmet_filetypes               " install emmet only for named filetypes
  autocmd!
  autocmd FileType html,eruby,javascript.jsx EmmetInstall
augroup END

" vim-markdown
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['html', 'css', 'rb=ruby', 'ruby', 'erb=eruby', 'javascript', 'js=javascript', 'bash=sh', 'sql', 'py=python', 'python', 'yaml', 'json']

" css plugins
augroup help_css_property_highlighting
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" airline
set noshowmode                        " removes automatic MODE display

let g:airline_extensions=[]           " default enabled airline extensions
let g:airline_highlighting_cache=1
let g:airline_symbols_ascii=1         " use ascii symbols
let g:airline_theme='gruvbox'
let g:airline_section_b='%-0.40{getcwd()}'

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''


" ==========================
" GENERAL SETTINGS & OPTIONS
" ==========================

filetype plugin indent on             " filetype detection, ft indent and plugins
set directory^=$HOME/.vim/tmp//       " prepends .vim/tmp/ to list of swp file
                                      " locations; prevents cluttering working dir
set backupcopy=yes                    " when file is saved and backup is made
                                      " the file is overwritten & the backup
                                      " is a proper copy; if the edited file
                                      " is a link, this preserves the link in
                                      " the original.

augroup swap_file_behavior
  autocmd!
  autocmd SwapExists * if getftime(expand('<afile>:p')) > getftime(v:swapname) | let v:swapchoice='d' | endif
augroup END

" COLORS & SYNTAX

" Enable true (24-bit) color (see :h xterm-true-color)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
colorscheme gruvbox
set background=dark

" set filetypes for difficult cases
augroup filetype_recongnition
  autocmd!
  autocmd BufNewFile,BufRead *.git{,modules/**/,worktrees/*/}{COMMIT_EDIT,TAG_EDIT,MERGE_,}MSG set filetype=gitcommit

  autocmd BufNewFile,BufRead */.bashrc.d/* set filetype=bash

  autocmd BufNewFile,BufRead requirements*.txt set filetype=python

  autocmd BufNewFile,BufRead [Tt]iltfile set filetype=python
  autocmd BufNewFile,BufRead *[Tt]iltfile* setfiletype python

  autocmd BufNewFile,BufRead [Jj]enkinsfile set filetype=groovy
  autocmd BufNewFile,BufRead *[Jj]enkinsfile* setfiletype groovy

  autocmd BufNewFile,BufRead *y{,a}ml.example setfiletype yaml
augroup END

" SPACES, TABS, SCREEN TEXT FORMATTING
set wrap                              " allow visual line wrapping
set textwidth=0                       " disable auto new line
set wrapmargin=0                      " disable EOL at wrap
set expandtab                         " <TAB> insert softtabstop # spaces
set shiftwidth=2                      " columns for autoindent & commands: >>, <<, ==
set shiftround                        " round autoindent to multiple of shiftwidth
set softtabstop=2                     " columns per entered <TAB>, <BS>
set tabstop=2                         " columns per read <TAB>
set autoindent                        " new line copies previous line indent
set list                              " display invisible chars
set listchars=tab:>-,space:·,eol:¬,trail:+ " whitespace chars
set linebreak                         " visual wrap at breakat chars
let s:breakvalue = "--"               " set breakvalue to allow toggling
let &showbreak = s:breakvalue
set colorcolumn=80

" filetype-based overrides
augroup makefiles
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd FileType make setlocal tabstop=8
  autocmd FileType make setlocal softtabstop=8
  autocmd FileType make setlocal shiftwidth=8
augroup END

augroup python_files
  autocmd!
  autocmd FileType python setlocal tabstop=8
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal softtabstop=4
augroup END

augroup git_messages
  autocmd!
  autocmd FileType gitcommit setlocal tabstop=8
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal colorcolumn=72
  autocmd FileType gitcommit setlocal spell
augroup END

augroup git_config
  autocmd!
  autocmd FileType gitconfig setlocal noexpandtab
  autocmd FileType gitconfig setlocal tabstop=8
  autocmd FileType gitconfig setlocal softtabstop=8
  autocmd FileType gitconfig setlocal shiftwidth=8
augroup END

augroup markdown_options
  autocmd!
  autocmd FileType markdown setlocal spell
augroup END

" REGISTERS
" use "+ register as default
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set pastetoggle=<F2>                  " toggle pasting via terminal clipboard

" UI
set number
set relativenumber

let &t_SI = "\<Esc>[6 q"              " insert mode cursor is a beam
let &t_SR = "\<Esc>[3 q"              " replace mode cursor is blinking underline
let &t_EI = "\<Esc>[1 q"              " other mode cursors are blocks

set cursorline                        " identify current line
highlight CursorLine gui=underline cterm=underline guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE

augroup cursor_line_toggle
  autocmd!
  autocmd InsertEnter,InsertLeave * set cursorline!
augroup END

" TEXT SEARCH
set showmatch                         " highlight matching parens
set hlsearch
set incsearch                         " incremental highlight search matches
highlight Search ctermfg=142 ctermbg=235 guifg=#b8bb26 guibg=#282828

" FILES AND BUFFERS
set hidden                            " prevent unloading abandoned buffers
set path+=**                          " search into subdirs
set wildmenu
set wildmode=longest:full,full

" MAPPINGS
" ========
inoremap jj <esc>

" FZF file search
nnoremap <C-f> :FZF<CR>

" MOVEMENT  (real lines if count is given, else visual lines)
noremap <expr> j (v:count ? 'j' : 'gj')
noremap <expr> k (v:count ? 'k' : 'gk')

" MOVE LINES with Shifted direction keys
" nnoremap J :m .+1<CR>==
" nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" WINDOW NAVIGATION
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" TOGGLE UI METADATA
nnoremap <F3> :set number!<CR>
nnoremap <F4> :set invrelativenumber<CR>
nnoremap <F5> :set list!<CR>

" toggle linebreak character btwn empty string and default
function! Showbreak_toggle()
  if &showbreak == s:breakvalue
    let &showbreak = ''
  else
    let &showbreak = s:breakvalue
  endif
endfunction

nnoremap <F6> :call Showbreak_toggle()<CR>

" LEADER MAPPINGS
let mapleader = "\<space>"
" nnoremap <leader><space> :nohlsearch<cr>
" remove search highlights by overwriting last search register ('/')
nnoremap <leader><space> :let @/=''<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>l :ls<cr>:b<space>

" LOCAL LEADER MAPPINGS
let maplocalleader = "\<bs>"

" ABBREVIATIONS
" =============
augroup markdown_snippets
  autocmd!
  " code fencing
  autocmd FileType markdown :inoreabbrev <buffer> jfn ```javascript
        \<cr>```<esc><s-o>
  autocmd FileType markdown :inoreabbrev <buffer> rfn ```ruby
        \<cr>```<esc><s-o>
  autocmd FileType markdown :inoreabbrev <buffer> cfn ```css
        \<cr>```<esc><s-o>
  autocmd FileType markdown :inoreabbrev <buffer> hfn ```html
        \<cr>```<esc><s-o>
augroup END
