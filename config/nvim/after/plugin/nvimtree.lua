require("nvim-tree").setup{
    filters = {
      dotfiles = true,
      exclude = {'node_modules', '.git', '.cache', '.vscode', '.idea'}
    }
  }
