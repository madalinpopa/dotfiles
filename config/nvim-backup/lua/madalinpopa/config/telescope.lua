------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    return
end

telescope.load_extension('media_files')

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {"smart"},
        file_ignore_patterns = {"node_modules"}
    }
}

local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true
}

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {
    noremap = true
})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {
    noremap = true
})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {
    noremap = true
})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {
    noremap = true
})

