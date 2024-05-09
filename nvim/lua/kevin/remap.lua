vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Dictionary autocomplete
-- inoremap <expr> <C-x><C-k> fzf#vim#complete('cat /usr/share/dict/words')
-- Create matching curly brace for loops, if statements, etc.
vim.keymap.set('i', '{<cr>', '{<cr>}<esc>O')

-- Esc key remap
vim.keymap.set('i', 'jj', '<esc>')

-- Delete word in insert mode, not working
-- imap <C-BS> <C-W>

-- Turn on and off highlighting
-- vim.keymap.set('n', '/', ':set hlsearch<cr>/')

-- Vertical movement for linewrap
vim.keymap.set('n', 'j', function()
    return vim.v.count > 0 and 'j' or 'gj'
end, {expr = true})
vim.keymap.set('n', 'k', function()
    return vim.v.count > 0 and 'k' or 'gk'
end, {expr = true})

-- Bracket motions
-- Buffer list
vim.keymap.set('n', '[b', ':bp<cr>zz')
vim.keymap.set('n', ']b', ':bn<cr>zz')
vim.keymap.set('n', '[B', ':bf<cr>zz')
vim.keymap.set('n', ']B', ':bl<cr>zz')

-- Location list
vim.keymap.set('n', '[l', ':lp<cr>zz')
vim.keymap.set('n', ']l', ':ln<cr>zz')
vim.keymap.set('n', '[L', ':lf<cr>zz')
vim.keymap.set('n', ']L', ':ll<cr>zz')

-- Quickfix list
vim.keymap.set('n', '[c', ':cp<cr>zz')
vim.keymap.set('n', ']c', ':cn<cr>zz')
vim.keymap.set('n', '[C', ':cf<cr>zz')
vim.keymap.set('n', ']C', ':cl<cr>zz')

-- Toggle options
vim.keymap.set('n', '[on', ':set number<cr>')
vim.keymap.set('n', ']on', ':set nonumber<cr>')
vim.keymap.set('n', '[or', ':set relativenumber<cr>')
vim.keymap.set('n', ']or', ':set norelativenumber<cr>')
vim.keymap.set('n', '[oh', ':set hlsearch<cr>')
vim.keymap.set('n', ']oh', ':set nohlsearch<cr>')
vim.keymap.set('n', '[ov', function()
    vim.diagnostic.config({ virtual_text = true })
    vim.cmd('highlight DiagnosticUnderlineWarn gui=undercurl')
end)
vim.keymap.set('n', ']ov', function()
    vim.diagnostic.config({ virtual_text = false })
    vim.cmd('highlight DiagnosticUnderlineWarn gui=NONE')
end)

-- Add newlines
vim.keymap.set('n', '[<space>', 'O<esc>j')
vim.keymap.set('n', ']<space>', 'o<esc>k')

-- Y to yank to end of line
vim.keymap.set('n', 'Y', 'y$')

-- Yank to system clipboard
-- nnoremap <leader>y "+y
-- vnoremap <leader>y "+y
-- vnoremap <leader>Y "+Y

-- Delete to void register
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Paste visually selected region and don't save
vim.keymap.set('x', '<leader>p', '"_dP')

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

-- String search centered
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')

-- Close focus window centered
vim.keymap.set('n', '<C-w>o', '<C-w>ozz')

-- Method jumps centered
vim.keymap.set('n', '[m', '[mzz')
vim.keymap.set('n', ']m', ']mzz')

-- Goto definition centered
vim.keymap.set('n', 'gd', 'gdzz')

-- Page ups and downs are centered
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

-- Edit vimrc from other files
vim.keymap.set('n', '<leader>ev', ':sp $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- Make vertical scrolling centered
vim.keymap.set('n', '<up>', 'kzz')
vim.keymap.set('n', '<down>', 'jzz')

-- Make next search term centered in page
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Goto definition centered
vim.keymap.set('n', 'gd', 'gdzz')

-- Make local mark jumping centered
local centerMarks = function()
     local letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
     for i=1,26,1 do
         vim.keymap.set('n', "'" .. letters[i], "'" .. letters[i] .. 'zz')
     end
end
centerMarks()

-- Resize windows
vim.keymap.set('n', '<C-up>', '<C-W>+')
vim.keymap.set('n', '<C-down>', '<C-W>-')
vim.keymap.set('n', '<C-right>', '<C-W>>')
vim.keymap.set('n', '<C-left>', '<C-W><')

-- Surround visually selected portion with quotes
--vim.keymap.set('v', '<leader>"', 'c""<esc>hp')
--vim.keymap.set('v', '<leader>'', 'c''<esc>hp')

-- Usually looks backwards for { in first column
-- Look backwards for the earliest previous unmatched {
--nnoremap [[ ?{<CR>w99[{

-- Usually looks for previous } in first column
-- Look for next } in first column, jump to its {, search backwards for }
--nnoremap [] k$][%?}<CR>

-- Usually looks for next } in first column
-- Find next }, go inside of it, then find earliest }
--nnoremap ][ /}<CR>b99]}

-- Usually looks for next { in first column
-- Look for next { in first column, jump to its }, search forward for {
-- nnoremap ]] j0[[%/{<CR>
