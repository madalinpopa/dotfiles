------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------
local M = {}

M.setup = function()
    local signs = {{
        name = "DiagnosticSignError",
        text = ""
    }, {
        name = "DiagnosticSignWarn",
        text = ""
    }, {
        name = "DiagnosticSignHint",
        text = ""
    }, {
        name = "DiagnosticSignInfo",
        text = ""
    }}

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = ""
        })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs
        },
        update_in_insert = true,
        underline = false,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = ""
        }
    }

    vim.diagnostic.config(config)

--     VIM.LSP.HANDLERS["TEXTDOCUMENT/HOVER"] = VIM.LSP.WITH(VIM.LSP.HANDLERS.HOVER, {
--         BORDER = "ROUNDED"
--     })
--
--     VIM.LSP.HANDLERS["TEXTDOCUMENT/SIGNATUREHELP"] = VIM.LSP.WITH(VIM.LSP.HANDLERS.SIGNATURE_HELP, {
--         BORDER = "ROUNDED"
--     })
end

return M
