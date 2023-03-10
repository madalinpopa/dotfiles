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
-- vim.keymap.set('n', '<leader>q', ':q!<CR>', defaults)

-- Quick save
-- vim.keymap.set('n', '<leader>w', ':w<CR>', defaults)
