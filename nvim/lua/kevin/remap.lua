vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Dictionary autocomplete
-- inoremap <expr> <C-x><C-k> fzf#vim#complete('cat /usr/share/dict/words')
-- Create matching curly brace for loops, if statements, etc.
vim.keymap.set('i', '{<cr>', '{<cr>}<esc>O')
vim.keymap.set('i', '[<cr>', '[<cr>]<esc>O')
vim.keymap.set('i', '(<cr>', '(<cr>)<esc>O')

-- Esc key remap
vim.keymap.set('i', 'jj', '<esc>')

-- Delete word in insert mode, not working
-- imap <C-BS> <C-W>

-- Turn on off highlighting on search
vim.keymap.set('n', '/', ':set nohlsearch<cr>/')

-- Vertical movement for linewrap
vim.keymap.set('n', 'j', function()
    return vim.v.count > 0 and 'j' or 'gj'
end, {expr = true})
vim.keymap.set('n', 'k', function()
    return vim.v.count > 0 and 'k' or 'gk'
end, {expr = true})

-- Horizontal movement
vim.keymap.set('n', '<C-l>', '2zl')
vim.keymap.set('n', '<C-h>', '2zh')

-- Bracket motions
-- Buffer list
vim.keymap.set('n', '[b', ':bp<cr>zz')
vim.keymap.set('n', ']b', ':bn<cr>zz')
vim.keymap.set('n', '[B', ':bf<cr>zz')
vim.keymap.set('n', ']B', ':bl<cr>zz')

-- Location list
vim.keymap.set('n', '[l', ':lp<cr>zz')
vim.keymap.set('n', ']l', ':lne<cr>zz')
vim.keymap.set('n', '[L', ':lf<cr>zz')
vim.keymap.set('n', ']L', ':ll<cr>zz')

-- Quickfix list
-- vim.keymap.set('n', '[c', ':cp<cr>zz')
-- vim.keymap.set('n', ']c', ':cn<cr>zz')
vim.keymap.set('n', '[C', ':cf<cr>zz')
vim.keymap.set('n', ']C', ':cl<cr>zz')

-- Toggle options
vim.keymap.set('n', '[or', ':set relativenumber!<cr>')
vim.keymap.set('n', '[oh', ':set hlsearch!<cr>')
vim.keymap.set('n', '[ow', ':set wrap!<cr>')

-- Toggle LSP warnings
local virtual_text_enabled = true
vim.keymap.set('n', '[ov', function()
    virtual_text_enabled = not virtual_text_enabled
    if virtual_text_enabled then
        vim.diagnostic.config({ virtual_text = true })
        vim.cmd('highlight DiagnosticUnderlineWarn gui=undercurl')
        vim.cmd('highlight DiagnosticUnderlineError gui=undercurl')
        vim.diagnostic.config({
            signs = true,
        })
    else
        vim.diagnostic.config({ virtual_text = false })
        vim.cmd('highlight DiagnosticUnderlineWarn gui=NONE')
        vim.cmd('highlight DiagnosticUnderlineError gui=NONE')
        vim.cmd('highlight DiagnosticUnderlineHint gui=NONE')
        vim.cmd('highlight DiagnosticUnderlineInfo gui=NONE')
        vim.diagnostic.config({
            signs = false,
        })
    end
end)

-- Toggle indent width
local is_two_space_indent = false
vim.keymap.set('n', '[ot', function()
    is_two_space_indent = not is_two_space_indent
    if is_two_space_indent then
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.notify(':set shiftwidth=2')
    else
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
        vim.notify(':set shiftwidth=4')
    end
end)

-- Add newlines
vim.keymap.set('n', '[<space>', 'O<esc>j')
vim.keymap.set('n', ']<space>', 'o<esc>k')

-- Y to yank to end of line
vim.keymap.set('n', 'Y', 'y$')

-- Delete to void register
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Paste visually selected region and don't save
vim.keymap.set('x', '<leader>p', '"_dP')

-- Edit vimrc from other files
vim.keymap.set('n', '<leader>ev', ':sp $MYVIMRC<cr>')
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- Resize windows
vim.keymap.set('n', '<C-up>', '<C-W>+')
vim.keymap.set('n', '<C-down>', '<C-W>-')
vim.keymap.set('n', '<C-right>', '<C-W>>')
vim.keymap.set('n', '<C-left>', '<C-W><')

-- Make local mark jumping centered
local centerMarks = function()
    -- a to z ASCII
    for i = 97, 122 do
        vim.keymap.set('n', "'" .. string.char(i), "'" .. string.char(i) .. 'zz')
    end
end
centerMarks()

-- Center after the following commands
local centerCmds = function()
    local cmds = {
        'gd',
        '<C-u>',
        '<C-d>',
        '<C-f>',
        '<C-b>',
        '<up>',
        '<down>',
        'n',
        'N',
        'gd',
        '<C-o>',
        '<C-i>',
        '*',
        '#',
        '<C-w>o',
        '[m',
        ']m',
        '<C-j>',
    }
    for _, cmd in ipairs(cmds) do
        vim.keymap.set('n', cmd, cmd .. 'zz')
    end
end
centerCmds()

-- Centered scrolling
vim.keymap.set('n', '<C-k>', 'kzz')


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
