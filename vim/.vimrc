" Colors 
syntax enable
autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown " recognize i.md as markdown
let g:markdown_fenced_languages = ['html', 'css', 'ruby', 'javascript', 'bash=sh'] " fenced code block syntax highlighting in markdown files
set background=dark
colorscheme Tomorrow-Night-Eighties

" Spaces and Tabs 
set expandtab " <TAB> insert softtabstop amount of spaces 
set shiftwidth=2 " spaces for autoindenting, >>, << and == (i.e. NORMAL or VISUAL mode)
set softtabstop=2 " spaces per <TAB> or <BS> (i.e. INSERT mode)
set tabstop=2 " spaces per read <TAB> char
set autoindent " new line copies indentation from prev line
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
set showmatch " highlight matching parens
set hlsearch " highlight all search matches
set incsearch " incremental highlight search matches

" Key Remapping
inoremap jj <ESC>
nnoremap <leader><SPACE> :nohl<CR>
