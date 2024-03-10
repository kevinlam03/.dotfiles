let mapleader=" "

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
" Use Powershell when running terminal inside vim
set shell=powershell
set gp=git\ grep\ -n

" Turn on and off highlighting
nnoremap / :set hlsearch<cr>/
nnoremap <leader>/ :nohlsearch<cr>
let g:loaded_matchparen = 1

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

call plug#begin('~/vimfiles/autoload/')

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()


if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->['typescript-language-server']},
        \ 'allowlist': ['typescript'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> K <plug>(lsp-hover)
"    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if has('win32')
    noremap <C-v> <C-v>
endif

" Don't show virtual diagnostic text while typing
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
" Align it right
let g:lsp_diagnostics_virtual_text_align = "right"
let g:lsp_inlay_hints_enabled = 0

" Key Bindings
" Create matching curly brace for loops, if statements, etc.
inoremap {<cr> {<cr>}<esc>O

" Esc key remap
inoremap jj <esc>

" inoremap ( ()<esc>i

" Edit vimrc from other files
nnoremap <leader>ev :sp $MYVIMRC<cr>
" Not sure if this is working
nnoremap <leader>sv :source $MYVIMRC<cr>

" Search files FZF
nnoremap <leader>f :Files<cr>

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
