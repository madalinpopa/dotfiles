------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------

------------------------------------------------------
-- NEOVIM API ALIASSES
------------------------------------------------------
local g = vim.g         		-- global variables
local o = vim.o         		-- global options
local b = vim.bo        		-- buffer-scoped options
local w = vim.wo        		-- windows-scoped options

------------------------------------------------------
-- SETTINGS
------------------------------------------------------
g.mapleader = ','                   -- Set leader to ''
g.maplocalleader = ','              -- Set local leader to ''

-- Global options
------------------------------------------------------
-- Set tabs to use spaces
o.expandtab = true

-- Set highlight on search
o.hlsearch = false

-- Enable mouse mode
o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
o.clipboard = 'unnamedplus'

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
o.termguicolors = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Window scoped options
------------------------------------------------------
-- Make line numbers default
w.number = true

-- Update line numbers for scroll
w.scroll = 5

-- Highlight cursor line
w.cursorline = true

