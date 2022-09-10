------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------
------------------------------------------------------
-- Load vim diagnostic setup
------------------------------------------------------
local status_ok, diagnostic = pcall(require, "madalinpopa.lsp.diagnostic")
if not status_ok then
    return
end

diagnostic.setup()

------------------------------------------------------
-- General mappings
------------------------------------------------------
local kopts = {
    noremap = true,
    silent = true
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, kopts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, kopts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, kopts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, kopts)

------------------------------------------------------
-- Configure servers
------------------------------------------------------

local tailwindcss_opts = require("madalinpopa.lsp.setup.tailwindcss")
local pyright_opts = require("madalinpopa.lsp.setup.pyright")
local sumneko_opts = require("madalinpopa.lsp.setup.sumneko")
local jsonls_opts = require("madalinpopa.lsp.setup.jsonls")
local emmet_opts = require("madalinpopa.lsp.setup.emmet")

local opts = {
    on_attach = require("madalinpopa.lsp.options").on_attach,
    capabilities = require("madalinpopa.lsp.options").capabilities
}

------------------------------------------------------
-- Update LSP config
------------------------------------------------------
require("nvim-lsp-installer").setup({
    ensure_installed = {'pyright', 'tailwindcss', 'jsonls', 'emmet_ls'}
})
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup {
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
}

lspconfig.pyright.setup {
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
}

lspconfig.tailwindcss.setup {
    opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
}

lspconfig.jsonls.setup {
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
}

lspconfig.emmet_ls.setup {
    opts = vim.tbl_deep_extend("force", emmet_opts, opts)
}

-- local servers = {'pyright', 'sumneko_lua', 'tailwindcss', 'jsonls', 'emmet_ls'}

-- for _, lsp in pairs(servers) do
--     require('lspconfig')[lsp].setup {
--         opts = opts
--     }
-- end
