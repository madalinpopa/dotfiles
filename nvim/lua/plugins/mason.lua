return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "gopls",
            "lua_ls",
            "pyright",
            "tailwindcss",
            "rust_analyzer"
        },
    },
    dependencies = {
        "neovim/nvim-lspconfig",
        { "mason-org/mason.nvim", opts = {} },
    },
}
