------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------

------------------------------------------------------
-- GENERAL MAPPINGS
------------------------------------------------------
local defaults = {noremap = true, silent = true}

-- Disable arrow navigation
vim.keymap.set('', '<UP>', '<NOP>', {noremap = true})
vim.keymap.set('', '<DOWN>', '<NOP>', {noremap = true})
vim.keymap.set('', '<LEFT>', '<NOP>', {noremap = true})
vim.keymap.set('', '<RIGHT>', '<NOP>', {noremap = true})

-- Moving around split navigations
vim.keymap.set('n', '<C-j>', '<C-w>j', defaults)
vim.keymap.set('n', '<C-k>', '<C-w>k', defaults)
vim.keymap.set('n', '<C-l>', '<C-w>l', defaults)
vim.keymap.set('n', '<C-h>', '<C-w>h', defaults)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", defaults)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", defaults)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", defaults)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", defaults)

-- Quick exit without save
vim.keymap.set('n', '<leader>q', ':q!<CR>', defaults)

-- Quick save
vim.keymap.set('n', '<leader>w', ':w<CR>', defaults)

-- Run python file
vim.keymap.set('n', '<leader>r', ':!python %<CR>', defaults)

-- Quick escape
-- vim.keymap.set('i', 'jk', '<ESC>', defaults)
