vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General Settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.showmode = true
vim.opt.showcmd = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

vim.opt.wildmenu = true

vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.clipboard = 'unnamedplus'

-- Save undo history
vim.opt.undofile = true

vim.opt.signcolumn = 'no'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10

-- Mappings
-- Dictionary autocomplete
-- inoremap <expr> <C-x><C-k> fzf#vim#complete('cat /usr/share/dict/words')
-- Create matching curly brace for loops, if statements, etc.
vim.keymap.set('i', '{<cr>', '{<cr>}<esc>O')

-- Esc key remap
vim.keymap.set('i', 'jj', '<esc>')

-- Delete word in insert mode, not working
-- imap <C-BS> <C-W>

-- Turn on and off highlighting
vim.keymap.set('n', '/', ':set hlsearch<cr>/')
vim.keymap.set('n', '<esc><esc>', ':set nohlsearch<cr>')

-- Vertical movement for linewrap
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

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
--[[function CenterMarks() 
    let letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    for letter in letters
        let remap = "nnoremap '" . letter . " '" . letter . "zz"
        execute remap
    endfor
endfunction
call CenterMarks()
--]]
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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    { 
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }
})

-- Netrw
vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

-- FZF
vim.keymap.set("n", "<leader>f",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>b",
  "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set("n", "<leader>/",
  "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })

-- Treesitter
require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { 
        "typescript",
        "javascript",
        "vim",
        "vimdoc",
        "query",
        "python" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
            enable = true,

            additional_vim_regex_highlighting = false,
        },
    }
