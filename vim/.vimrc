" Colors 
syntax enable
autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown " enable recognition of .md as markdown
let g:markdown_fenced_languages = ['html', 'css', 'ruby', 'bash=sh'] " enable fenced code block syntax highlighting in markdown files
set background=dark
colorscheme Tomorrow-Night-Eighties

" Spaces and Tabs 
set expandtab " <TAB> insert softtabstop amount of spaces 
set shiftwidth=2 " spaces for autoindenting, >>, << and == (i.e. NORMAL or VISUAL mode indentation)
set softtabstop=2 " spaces per <TAB> or <BS> (i.e. INSERT mode indentation)
set tabstop=2 " spaces per read <TAB> char 
set autoindent " new line copies indentation from prev line
set list " display invisible chars
set listchars=tab:>-,space:·,eol:¬ " set chars to be displayed for whitespace types

" Paste
set pastetoggle=<F2> "allow pasting via term. clipboard without adding indentations (normally can't distinguish pasted from typed text); to use: enter insert mode; toggle paste; paste using terminal; toggle off paste;

" UI 
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set showmatch " highlight matching parens
set hlsearch " highlight all search matches
set foldmethod=syntax

" Key Remapping
inoremap jj <ESC>
