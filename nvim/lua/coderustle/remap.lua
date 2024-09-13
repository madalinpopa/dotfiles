

-- Keymaps for quick save and exit
vim.keymap.set("n", "<leader>ww",  ":w<CR>")
vim.keymap.set("n", "<leader>q",  ":q!<CR>")

-- Keymaps for explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Disable arrow navigation
vim.keymap.set('', '<UP>', '<NOP>', { noremap = true })
vim.keymap.set('', '<DOWN>', '<NOP>', { noremap = true })
vim.keymap.set('', '<LEFT>', '<NOP>', { noremap = true })
vim.keymap.set('', '<RIGHT>', '<NOP>', { noremap = true })


-- Moving around split navigations
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true })

-- Keymap to move block of lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle when using pager
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Add keympa for copilot to accept only one word
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
