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

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Ensure that automatic filetype detection is
cmd('filetype on')
