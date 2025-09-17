let mapleader=" "

" General Settings
syntax on
set termguicolors
set cursorline
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
set wildmode=longest:full
set linebreak
set clipboard+=unnamed
set mouse=a
set updatetime=250
set timeoutlen=1000
set laststatus=2

let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" Turn on matching parenthesis setting manually, so it doesn't trigger
let g:loaded_matchparen = 1

" Mappings

" Open netrw
nnoremap <C-n> :Explore<cr>

inoremap {<cr> {<cr>}<esc>O

" Esc key remap
inoremap jj <esc>

" Delete word in insert mode
imap <C-h> <C-W>

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
nnoremap [on :set number!<cr>
nnoremap [or :set relativenumber!<cr>
nnoremap [oh :set hlsearch!<cr>

" Add newlines
nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k

" Y to yank to end of line
nnoremap Y y$
                        
" Delete to void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Replace visually selected region and don't save
xnoremap <leader>p "_dP

" String search centered
nnoremap * *zz
nnoremap # #zz

" Close focus window centered
nnoremap <C-w>o <C-w>ozz

" Method jumps centered
nnoremap [m [mzz
nnoremap ]m ]mzz

" Goto definition centered
nnoremap gd gdzz

" Page ups and downs are centered
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" Jump list
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

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

" Make local mark jumping centered
function CenterMarks() 
    let letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    for letter in letters
        let remap = "nnoremap '" . letter . " '" . letter . "zz"
        execute remap
    endfor
endfunction
call CenterMarks()

" Resize windows
nnoremap <C-up> <C-W>+
nnoremap <C-down> <C-W>-
nnoremap <C-right> <C-W>>
nnoremap <C-left> <C-W><

" Surround visually selected portion with quotes
vnoremap <leader>" c""<esc>hp
vnoremap <leader>' c''<esc>hp

" Statusline settings
set laststatus=2
set statusline=%f%m%r%w\ " filepath and modify read and preview flags
set statusline+=%y\ 
"
set statusline+=%=
"
set statusline+=[line:\ %l/%L]\ 
