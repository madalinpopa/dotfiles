------------------------------------------------------
-- Author: Madalin Popa
--
-- Email: madalin@coderustle.ro
------------------------------------------------------


-- Global options
------------------------------------------------------

-- Set default leader
vim.g.mapleader = ","

-- Configure the appearance of the mouse
vim.opt.guicursor = ""

-- Set relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tabs to use spaces
vim.opt.expandtab = true

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 300
vim.opt.timeoutlen = 150

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Set default tab stop
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Number of spaces to use for each step
vim.opt.shiftwidth = 4

-- Disable swapfile
vim.opt.swapfile = false

-- Set the number of lines for scroll
vim.opt.scrolloff = 8

vim.opt.colorcolumn = ""

--vim.opt.termguicolors = true
