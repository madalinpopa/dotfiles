require("nvim-tree").setup{
    filters = {
      dotfiles = false,
      exclude = {'dist', '.github'},
      custom = {'.git', '.yarn', 'node_modules'}
    }
  }
