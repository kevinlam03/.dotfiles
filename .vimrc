let mapleader=" "

" General Settings
syntax on
set termguicolors
set splitright
set splitbelow
set backspace=indent,eol,start,nostop
set nocompatible
set showcmd
set number
set relativenumber
set incsearch
set hidden
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set linebreak
set dictionary=/usr/share/dict/words
set clipboard=unnamedplus
" Use Powershell when running terminal inside vim
"set shell=powershell

" Turn on matching parenthesis setting manually, so it doesn't trigger
"let g:loaded_matchparen = 1
autocmd BufWinEnter *.vimrc loadview
autocmd BufWinLeave *.vimrc mkview
" Use ripgrep as external grep tool
set gp=rg\ --vimgrep\ --smart-case\ --follow
 

" Mappings
" Dictionary autocomplete
" inoremap <expr> <C-x><C-k> fzf#vim#complete('cat /usr/share/dict/words')
" Create matching curly brace for loops, if statements, etc.
inoremap {<cr> {<cr>}<esc>O

" Esc key remap
inoremap jj <esc>

" Delete word in insert mode, not working
" imap <C-BS> <C-W>

" Turn on and off highlighting
nnoremap / :set hlsearch<cr>/
nnoremap <esc><esc> :set nohlsearch<cr>

" Vertical movement for linewrap
nnoremap j gj
nnoremap k gk

" Bracket motions
" Buffer list
nnoremap [b :bp<cr>zz
nnoremap ]b :bn<cr>zz
nnoremap [B :bf<cr>zz
nnoremap ]B :bl<cr>zz

" Location list
nnoremap [l :lp<cr>zz
nnoremap ]l :ln<cr>zz
nnoremap [L :lf<cr>zz
nnoremap ]L :ll<cr>zz

" Quickfix list
nnoremap [c :cp<cr>zz
nnoremap ]c :cn<cr>zz
nnoremap [C :cf<cr>zz
nnoremap ]C :cl<cr>zz

" Toggle options
nnoremap [on :set number<cr>
nnoremap ]on :set nonumber<cr>
nnoremap [or :set relativenumber<cr>
nnoremap ]or :set norelativenumber<cr>

" Add newlines
nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k

" Y to yank to end of line
nnoremap Y y$

" Yank to system clipboard
" nnoremap <leader>y "+y
" vnoremap <leader>y "+y
" vnoremap <leader>Y "+Y

" Delete to void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Paste visually selected region and don't save
xnoremap <leader>p "_dP

" Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" String search centered
nnoremap * *zz
nnoremap # #zz

" Close focus window centered
nnoremap <C-w>o <C-w>ozz

" Goto definition centered
nnoremap gd gdzz

" Page ups and downs are centered
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" Edit vimrc from other files
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Make vertical scrolling centered
nnoremap <up> kzz
nnoremap <down> jzz

" Make next search term centered in page
nnoremap n nzz
nnoremap N Nzz

" Goto definition centered
nnoremap gd gdzz

" Resize windows
nnoremap <C-up> <C-W>+
nnoremap <C-down> <C-W>-
nnoremap <C-right> <C-W>>
nnoremap <C-left> <C-W><

" Surround visually selected portion with "
vnoremap <leader>" c""<esc>hp
vnoremap <leader>' c''<esc>hp

" Usually looks backwards for { in first column
" Look backwards for the earliest previous unmatched {
"nnoremap [[ ?{<CR>w99[{

" Usually looks for previous } in first column
" Look for next } in first column, jump to its {, search backwards for }
"nnoremap [] k$][%?}<CR>

" Usually looks for next } in first column
" Find next }, go inside of it, then find earliest }
"nnoremap ][ /}<CR>b99]}

" Usually looks for next { in first column
" Look for next { in first column, jump to its }, search forward for {
"nnoremap ]] j0[[%/{<CR>


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
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'rose-pine/vim'

call plug#end()

" Use colorscheme plug
colo rosepine
let g:airline_theme='catppuccin_mocha'


" LSP Settings
" Don't show virtual diagnostic text while typing
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 1
" Align it right
let g:lsp_diagnostics_virtual_text_align = "right"
" Turn off highlighting of diagnostics errors (or could change color)
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_inlay_hints_enabled = 1
" Change text in gutter for diagnostics
"let g:lsp_diagnostics_signs_error = ""
"let g:lsp_diagnostics_signs_warning = ""
"let g:lsp_diagnostics_signs_information = "I"
"let g:lsp_diagnostics_signs_hint = "H"
" Turn off highlighting references
let g:lsp_document_highlight_enabled = 0
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> [g <plug>(lsp-previous-error)
    nmap <buffer> ]g <plug>(lsp-next-error)
    nmap <buffer> <leader><C-d> <plug>(lsp-document-diagnostics)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> ga <plug>(lsp-code-action-float)
    " Check if this is working
    nnoremap <buffer> <leader>lca <plug>(lsp-code-action)
    "nnoremap <buffer> <expr><c-u> lsp#scroll(-4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(+4)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" FZF settings
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>/ :BLines<cr>

" Statusline/Airline settings
let g:airline#extensions#tabline#enabled = 1 " Enable buffer list
let g:airline_section_y = '' " Disable encoding info
" % Encloses statusline words. # starts formatting block
" Also can pass this method a list of the items we want
let g:airline_section_z = airline#section#create('%#__accent_bold#ln:%l/%L %#__restore__#[%p%%]%')
" Disable warning messages from LSP, hard to read anyways
let g:airline_section_warning = ''
"set laststatus=2
"set statusline=%f%m%r%w\ " filepath and modify read and preview flags
"set statusline+=%y\ 
"
"set statusline+=%=
"
"set statusline+=[line:\ %l/%L]\ 
