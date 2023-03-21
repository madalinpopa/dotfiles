------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

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


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>1', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Quick save
vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap = true, silent = true})

-- Quick exit without save
vim.keymap.set('n', '<leader>q', ':q!<CR>', {noremap = true, silent = true})
