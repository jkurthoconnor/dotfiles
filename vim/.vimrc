" Colors 
syntax enable
autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown " enables recognition of .md as markdown
let g:markdown_fenced_languages = ['html', 'css', 'ruby', 'bash=sh'] " enables fenced code block syntax highlighting in markdown files
set background=dark
colorscheme Tomorrow-Night-Eighties

" Spaces and Tabs 
set expandtab " <TAB> inserts softtabstop amount of spaces 
set shiftwidth=2 " affects autoindenting and >> << ==
set tabstop=2 " number of visual spaces per read <TAB> char 
set softtabstop=2 " number of spaces per <TAB> or <BS>
" filetype indent on " turns on filetype detection and allows loading lang-specific indentation files
set autoindent " new line copies indentation from prev line

" Paste
set pastetoggle=<F2> "allow pasting text via terminal clipboard without adding indentations (problem exists because vim doesn't distinguish pasted text from typed text); to use: enter insert mode; toggle paste mode; paste using terminal; toggle off paste mode;

" UI 
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set showmatch " highlight matching parens

" Key Remapping
inoremap jj <ESC>
