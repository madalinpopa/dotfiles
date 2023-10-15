------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------
-- Quick save
vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap = true, silent = true})

-- Quick exit without save
vim.keymap.set('n', '<leader>q', ':q!<CR>', {noremap = true, silent = true})

-- Disable arrow navigation
vim.keymap.set('', '<UP>', '<NOP>', {noremap = true})
vim.keymap.set('', '<DOWN>', '<NOP>', {noremap = true})
vim.keymap.set('', '<LEFT>', '<NOP>', {noremap = true})
vim.keymap.set('', '<RIGHT>', '<NOP>', {noremap = true})

-- Moving around split navigations
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap = true})
vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap = true})


-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", {noremap = true})
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", {noremap = true})
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", {noremap = true})
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", {noremap = true})
