------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------

------------------------------------------------------
-- NEOVIM API ALIASSES
------------------------------------------------------
local cmd = vim.cmd     		-- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local fn = vim.fn       		-- call Vim functions
local g = vim.g         		-- global variables
local o = vim.o         		-- global options
local b = vim.bo        		-- buffer-scoped options
local w = vim.wo        		-- windows-scoped options

------------------------------------------------------
-- SETTING OPTIONS
-- See `:help vim.o`
------------------------------------------------------
g.mapleader = ','                   -- Set leader to ''
g.maplocalleader = ','              -- Set local leader to ''


-- Set the colorscheme
cmd[[colorscheme tokyonight-night]]


