" Colors 
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown " recognize .md as markdown
let g:markdown_fenced_languages = ['html', 'css', 'ruby', 'javascript', 'bash=sh'] " fenced code block syntax highlighting in markdown files
set background=dark
colorscheme onedark

" Spaces and Tabs 
set expandtab " <TAB> insert softtabstop amount of spaces 
set shiftwidth=2 " spaces for autoindenting, >>, << and ==
set softtabstop=2 " spaces per <TAB> or <BS> (i.e. INSERT mode)
set tabstop=2 " spaces per read <TAB> char
set autoindent " new line copies previous line indentation
filetype plugin indent on " auto indentation by filetype; scripts in `indent`
set list " display invisible chars
set listchars=tab:>-,space:·,eol:¬ " displayed whitespace chars

" Paste
set pastetoggle=<F2> " toggle pasting via terminal clipboard

" UI 
set number relativenumber " show relative line except on current line
set showcmd " show command in bottom bar
set ruler " show current position in bottom bar
set cursorline " highlight current line
:autocmd InsertEnter,InsertLeave * set cursorline! " toggles cursorline off in Insert mode

" Search
set showmatch " highlight matching parens
set hlsearch " highlight all search matches
set incsearch " incremental highlight search matches
set wildmenu
set wildmode=longest:list,full

" Key Remapping
inoremap jj <ESC>
nnoremap <leader><SPACE> :nohl<CR>
" split movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
