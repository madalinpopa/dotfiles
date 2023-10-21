------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------
-- Quick save
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Quick exit without save
vim.keymap.set('n', '<leader>q', ':q!<CR>', { noremap = true, silent = true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

-- format python files with black
vim.keymap.set('n', '<leader>f', ':!black %<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>tf', ':!djlint %<CR>', {noremap = true, silent = true})

------------------------------------------------------
-- Telescope Keymaps
------------------------------------------------------
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

------------------------------------------------------
-- Nvimtree keymaps
------------------------------------------------------

-- Nvim Tree plugin
vim.keymap.set('n', '<leader>nn', '<cmd>NvimTreeToggle<cr>', {noremap=true})
vim.keymap.set('n', '<leader>nr', '<cmd>NvimTreeRefresh<cr>', {noremap=true})
vim.keymap.set('n', '<leader>nf', '<cmd>NvimTreeFindFile<cr>', {noremap=true})


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>ee', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
