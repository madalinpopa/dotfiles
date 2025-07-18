-- Keymaps for quick save and exit
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")

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

-- Keymap to create a new tab
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")

-- Keymap to move between tabs
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tablast<CR>")

-- Clear search highlighting
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Indent in visual mode without losing selection
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Paste over selection without losing yanked text
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without losing yank" })

