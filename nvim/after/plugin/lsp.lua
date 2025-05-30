-- Setup Mason first
require('mason').setup()

-- Now, get the mason-lspconfig module
local mason_lspconfig = require 'mason-lspconfig'

-- Define your on_attach function, servers table, and capabilities
-- (Your existing definitions for these are fine)
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols') -- Note: You already have <leader>sd for telescope diagnostics
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    nmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic')
    nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic')
    nmap('<leader>do', vim.diagnostic.open_float, 'Open diagnostics float')              -- Changed from <leader>df to <leader>do to avoid conflict if you use <leader>f for format
    nmap('<leader>dl', "<cmd>Telescope diagnostics<CR>", 'List diagnostics (Telescope)') -- This is similar to your existing <leader>sd

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local servers = {
    pyright = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            }
        }
    },
    marksman = {
        filetypes = { 'markdown' },
    },
    ruff = {},
    gopls = {
        gofumpt = true,
    },
    tailwindcss = {
        includeLanguages = {
            templ = "html"
        }
    },
    emmet_ls = {
        filetypes = { "css", "templ", "tmpl", "html", "gohtml", "javascript" }
    },
    templ = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Configure mason-lspconfig with a single setup call
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers), -- Your existing ensure_installed logic
    handlers = {
        -- This is the default handler function
        function(server_name)
            require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
            }
        end,
        -- If you have custom handlers for specific servers, they would go here.
        -- For example:
        -- lua_ls = function()
        --     require('lspconfig').lua_ls.setup {
        --         capabilities = capabilities,
        --         on_attach = on_attach,
        --         settings = servers.lua_ls.Lua, -- or however you defined it
        --     }
        -- end,
    }
}
