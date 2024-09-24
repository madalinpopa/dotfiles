require("coderustle")

vim.cmd [[
  autocmd BufWritePre *.py lua vim.lsp.buf.format()
  autocmd BufWritePre *.go lua vim.lsp.buf.format()
  autocmd BufWritePre *.lua lua vim.lsp.buf.format()
]]

-- Highlight selection on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',

})


require('onedark').load()
