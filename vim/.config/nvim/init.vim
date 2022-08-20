" ********* BASIC SETTINGS ********
so $HOME/.config/nvim/vimrc/basic-settings.vim
" ********* KEY BINDS ********
so $HOME/.config/nvim/vimrc/key-bindings.vim

colorscheme darkspectrum

" ********* PLUGINS **********

" async autocomlete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-highlight',
  \ 'coc-rust-analyzer'
\ ]

call plug#begin('~/.config/nvim/plugged')

" utils
Plug 'brooth/far.vim' " crossbuffer find & replace
Plug 'danro/rename.vim', { 'on': 'Rename' } " rename a file inline :Rename
Plug 'yegappan/mru' " most recently used files :MRU
Plug 'https://github.com/Alok/notational-fzf-vim' " fzf powered note-taker :NV
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

" editing enhancements
Plug 'Raimondi/delimitMate' " auto close quotes, parens, etc

" integrations
Plug 'christoomey/vim-tmux-navigator' " vim hotkeys to jump into another tmux pane
Plug 'editorconfig/editorconfig-vim' " respect .editorconfig
Plug 'roxma/vim-tmux-clipboard' " yank to tmux clipboard 
Plug 'w0rp/ale' " display linting, type, and other info for LSP languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" information enhancements
Plug 'tpope/vim-fugitive' " many advanced git operations :Gblame :Glog etc
Plug 'airblade/vim-gitgutter' " line by line git status in the gutter
Plug 'itchyny/vim-cursorword' " underline the word under the cursor
Plug 'machakann/vim-highlightedyank' " highlight yanked content

" language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go
Plug 'b4winckler/vim-objc' " obc-c
Plug 'Quramy/tsuquyomi' " typescript completion
Plug 'peitalin/vim-jsx-typescript' " jsx/tsx syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " semantic syntax highlighting

" ad-hoc frameowrk support
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " styled-components

" ad-hoc file formats
Plug 'chrisbra/csv.vim' " csv
Plug 'cespare/vim-toml' " toml
Plug 'lepture/vim-jinja' " jinj & nunj
Plug 'dahu/vim-asciidoc' " asciidoc
    Plug 'Raimondi/VimRegStyle'
    Plug 'dahu/Asif'
    Plug 'vim-scripts/SyntaxRange'

" superficial
Plug 'vim-airline/vim-airline'        " status bar
Plug 'vim-airline/vim-airline-themes' " status bar themes
Plug 'norcalli/nvim-colorizer.lua'    " better colors
Plug 'dstein64/nvim-scrollview'       " non-interactive scroll-bars
Plug 'vim-scripts/scrollcolors'       " theme picker: SCROLLCOLORS

call plug#end()

lua require'colorizer'.setup()

" ********* PLUGIN SETTINGS ********

" christoomey/vim-tmux-navigator settings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>j :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>k :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>i :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>

" vim-airline/vim-airline settings
let g:airline_theme='powerlineish'   
let g:airline#extensions#tabline#enabled = 1 " always show buffers
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer numbers

" bind fzf to ctrlp
nnoremap <C-p> :FZF<cr>
" use rg for ctrlp
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" roxma/vim-tmux-clipboard settings
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 150

" Alok/notational-fzf-vim settings
let g:nv_search_paths = ["~/fz-notes", "~/LOG.md"]

" ********* FILE EXTENSIONS ********
"
au BufNewFile,BufRead *.nunj set ft=jinja
au BufNewFile,BufRead .envrc set ft=sh
au BufNewFile,BufRead *.asc set ft=asciidoc
au BufNewFile,BufRead .babelrc set ft=json
au BufNewFile,BufRead .eslintrc set ft=json
au BufNewFile,BufRead .stylelintrc set ft=json
au BufNewFile,BufRead Guardfile set ft=ruby
au BufNewFile,BufRead Jenkinsfile set ft=groovy
au BufReadPost *.rs setlocal ft=rust


" ********* CUSTOM SCRIPTS **********

" relative line number toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

set completeopt=menu

let g:far#source = "ag"

nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)

" tab completion
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" background color always transparent
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none
hi CocInlayHint gui=italic guibg=none guifg=#a37949 ctermbg=none

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "rust", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
