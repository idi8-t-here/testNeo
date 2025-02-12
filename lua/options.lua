require "nvchad.options"

-- add yours here!

vim.g.mapleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true


vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true


vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

--to customize nvim cursor**
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait0-blinkoff10-blinkon15-Cursor/lCursor,sm:block-blinkwait0-blinkoff10-blinkon15"

-- Set highlight groups for Cursor and iCursor
vim.api.nvim_set_hl(0, 'Cursor', {fg = 'purple', bg = 'purple'})
vim.api.nvim_set_hl(0, 'iCursor', {fg = 'purple', bg = 'purple'})
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
