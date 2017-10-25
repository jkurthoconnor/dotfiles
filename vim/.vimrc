" Colors 
syntax enable
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown " allows .md files to be recognized as markdown; by default only .markdown are recognized 
set background=dark
colorscheme Tomorrow-Night-Eighties

" Spaces and Tabs 
set tabstop=2 " number of visual spaces per read <TAB> char 
set expandtab " use spaces for tabs
set softtabstop=2 " number of spaces inserted per <TAB>
" filetype indent on " turns on filetype detection and allows loading lang-specific indentation files
set autoindent

" UI 
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set showmatch " highlight matching parens

" Key Remapping
inoremap jj <ESC>
