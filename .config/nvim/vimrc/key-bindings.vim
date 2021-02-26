" no shift for command mode
nnoremap ; :
nnoremap : ;

" hjkl via 'arrow keys' structured ijkl
noremap i k
noremap j h
noremap k j
noremap <C-w>j <C-w>h
noremap <C-w>i <C-w>k
noremap <C-w>k <C-w>j

setlocal linebreak " maybe not neeeded

" h replaces i for insert
noremap h i
noremap H I

" hh enters normal mode
inoremap hh <esc>
