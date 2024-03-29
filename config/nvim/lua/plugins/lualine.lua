-- Set lualine as statusline
-- https://github.com/nvim-lualine/lualine.nvim
return {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = false,
            theme = 'tokyonight',
            component_separators = '|',
            section_separators = '',
        },
    },
}
