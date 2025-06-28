function MyCustomColor(color)
    color = color or "everblush"
    -- color = color or "256_noir"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })    -- For non-current windows
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" }) -- Floating window borders
    -- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- End of buffer transparency
end

MyCustomColor()
