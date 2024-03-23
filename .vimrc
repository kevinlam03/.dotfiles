let mapleader=" "

" General Settings
syntax on
color pablo
set splitright
set backspace=indent,eol,start,nostop
set nocp
set nu
set rnu
set hidden
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set dictionary=/usr/share/dict/words
" Use Powershell when running terminal inside vim
"set shell=powershell
" Turn on matching parenthesis setting manually, so it doesn't trigger
"let g:loaded_matchparen = 1
autocmd BufWinEnter *.vimrc loadview
autocmd BufWinLeave *.vimrc mkview
set gp=git\ grep\ -n


" Mappings
" Dictionary autocomplete
" inoremap <expr> <C-x><C-k> fzf#vim#complete('cat /usr/share/dict/words')
" Create matching curly brace for loops, if statements, etc.
inoremap {<cr> {<cr>}<esc>O

" Esc key remap
inoremap jj <esc>

" inoremap ( ()<esc>i
" Turn on and off highlighting
nnoremap / :set hlsearch<cr>/
nnoremap <leader>/ :nohlsearch<cr>

" Edit vimrc from other files
nnoremap <leader>ev :sp $MYVIMRC<cr>
" Not sure if this is working
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>

" Make next search term centered in page
nnoremap n nzz
nnoremap N Nzz

" Resize windows
nnoremap <C-up> <C-W>+
nnoremap <C-down> <C-W>-
nnoremap <C-right> <C-W>>
nnoremap <C-left> <C-W><

" nnoremap <C-<Right>> <C-w>>

" Surround visually selected portion with "
vnoremap <leader>" c""<esc>hp
vnoremap <leader>' c''<esc>hp


" Statusline
set laststatus=2
set statusline=%f%m%r%w\ " filepath and modify read and preview flags
set statusline+=%y\ 

set statusline+=%=

set statusline+=[line:\ %l/%l]\ 


" Configure cursor
if &term =~ '^win32'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif


" Plugins
call plug#begin('~/vimfiles/autoload/')

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'

call plug#end()


" LSP Settings
" Don't show virtual diagnostic text while typing
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
" Align it right
let g:lsp_diagnostics_virtual_text_align = "right"
let g:lsp_inlay_hints_enabled = 0
" Turn off highlighting references
let g:lsp_document_highlight_enabled = 0
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nnoremap <buffer> gd <plug>(lsp-definition)
    nnoremap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> [g <plug>(lsp-previous-diagnostic)
    nnoremap <buffer> ]g <plug>(lsp-next-diagnostic)
    nnoremap <buffer> <leader>d <plug>(lsp-document-diagnostics)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

