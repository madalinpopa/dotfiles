-- https://github.com/nvim-tree/nvim-tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    opts = {
        filters = {
            dotfiles = false,
            exclude = { 'dist', '.github' },
            custom = {
                '.git', '.yarn', 'node_modules', 'venv', '.venv',
                '__pycache__'
            }
        }
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}
