" PACKAGE MANAGEMENT
" ================
" `:call minpac#update()` to update || install packages registered below
" `:call minpac#clean()` to uninstall && remove minpac-managed plugins no
" longer registered below
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-rails')
call minpac#add('mattn/emmet-vim')
call minpac#add('junegunn/fzf')

" syntax
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('cakebaker/scss-syntax.vim')
call minpac#add('PotatoesMaster/i3-vim-syntax')
call minpac#add('prettier/vim-prettier')

" aesthetics
call minpac#add('rakr/vim-one', { 'type': 'opt'})
call minpac#add('morhetz/gruvbox', { 'type': 'opt'})
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

" emmet
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings={'javascript.jsx' : { 'extends' : 'jsx' }}

augroup emmet_filetypes               " install emmet only for named filetypes
  autocmd!
  autocmd FileType html,eruby,javascript.jsx EmmetInstall
augroup END

" prettier
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2     " spaces per indentation level
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 0
let g:prettier#quickfix_auto_focus = 0

augroup set_prettier_behavior
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.json,*.md,*.yaml,*.html PrettierAsync
augroup END


" css plugins
augroup help_css_property_highlighting
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" airline
set noshowmode                        " removes automatic MODE display

let g:airline_extensions=[]           " default enabled airline extensions
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

augroup swap_file_behavior
  autocmd!
  autocmd SwapExists * if getftime(expand('<afile>:p')) > getftime(v:swapname) | let v:swapchoice='d' | endif
augroup END

" COLORS & SYNTAX
if (has("termguicolors"))
  set termguicolors                   " 24-bit (true-color) mode outside tmux
endif

syntax enable
colorscheme gruvbox
set background=dark

augroup filetype_recongnition
  autocmd!
  autocmd BufNewFile,BufFilePre,BufReadPost *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
  autocmd BufNewFile,BufRead *.git{,modules/**/,worktrees/*/}{COMMIT_EDIT,TAG_EDIT,MERGE_,}MSG set filetype=gitcommit
augroup END

let g:markdown_fenced_languages = ['html', 'css', 'rb=ruby', 'ruby', 'erb=eruby', 'javascript', 'js=javascript', 'bash=sh', 'sql', 'py=python', 'python', 'yaml', 'json']

" SPACES, TABS, SCREEN TEXT FORMATTING
set wrap                              " allow visual line wrapping
set textwidth=0                       " disable auto new line
set wrapmargin=0                      " disable EOL at wrap
set expandtab                         " <TAB> insert softtabstop # spaces
set shiftwidth=2                      " columns for autoindent & commands: >>, <<, ==
set softtabstop=2                     " columns per entered <TAB>, <BS>
set tabstop=2                         " columns per read <TAB>
set autoindent                        " new line copies previous line indent
set list                              " display invisible chars
set listchars=tab:>-,space:·,eol:¬,trail:+ " whitespace chars
set linebreak                         " visual wrap at breakat chars
set showbreak=--
set colorcolumn=80

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

" WINDOW NAVIGATION
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" LEADER MAPPINGS
let mapleader = "\<space>"
nnoremap <leader><space> :nohlsearch<cr>
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
