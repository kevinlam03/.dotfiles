vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
-- General Settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.signcolumn = 'no'
vim.opt.guicursor = 'a:block'

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show mode in statusline
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

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 1000

vim.opt.laststatus = 2


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10

-- Grep program
vim.opt.grepprg = 'rg --vimgrep --smart-case --follow'


-- Statusline
--vim.opt.statusline = '%f%m%r%w' -- filepath and modify read and preview flags
--vim.opt.statusline += '%y'
--vim.opt.statusline += '%='
--vim.opt.statusline +=  '[%l/%L]'
