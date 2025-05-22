-- nvim/lua/plugins/conform.lua
return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' }, -- Or 'VeryLazy'
    config = function()
        require('conform').setup({
            -- Notifies you when formatters are not found
            notify_on_error = true,

            -- Configure formatters
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'isort', 'black' },
                go = { 'gofmt', 'goimports' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                html = { 'prettier' },
                css = { 'prettier' },
                scss = { 'prettier' },
                less = { 'prettier' },
                json = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier' },
                graphql = { 'prettier' },
                astro = { 'prettier' }, -- Added based on your prettier.lua

                -- You can add more filetypes and their preferred formatters here
                -- Example:
                -- rust = { "rustfmt" },
            },

            -- Set up format on save
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true, -- Fallback to LSP formatting if no conform formatter is found
            },
        })

        -- Add a keymap for manual formatting (optional, but recommended)
        vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
            require('conform').format({ async = true, lsp_fallback = true })
        end, { desc = 'Format buffer with conform.nvim' })
    end,
    -- Optional: If you don't have the formatters installed globally,
    -- you can add them as dependencies for mason.nvim to install.
    -- dependencies = { 'mason.nvim' } -- If you want mason to install formatters
}
