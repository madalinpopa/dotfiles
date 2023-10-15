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

-- Set the colorscheme
cmd[[colorscheme tokyonight-night]]
