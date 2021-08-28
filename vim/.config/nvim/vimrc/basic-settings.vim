set termguicolors 
colorscheme custom
set nocompatible   " vi -> improved
set backupcopy=yes
set number         " show line numbers
set shiftwidth=2   " using tab will produce 2 spaces
set ruler          " display line and column number
set noshowmode     " do not display current mode since airline plugin will
set updatetime=750 " swapfile flush interval - also affects some plugins
set hidden         " allow buffers that are not visible to remain open
set ignorecase     " ignore case when searching
set smartcase      " don't ignore case when capital letters are in search
set undofile                       " store undofile
set undodir=~/.config/nvim/undodir " undo file dir
set undolevels=90000               " max number of undos
set tabstop=4
set expandtab
set smarttab
set completeopt-=preview
set completeopt=longest,menuone,menu
set incsearch 
set showmatch
set clipboard+=unnamedplus

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
