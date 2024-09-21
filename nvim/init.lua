require("coderustle")

vim.cmd [[
  autocmd BufWritePre *.py lua vim.lsp.buf.format()
  autocmd BufWritePre *.go lua vim.lsp.buf.format()
  autocmd BufWritePre *.lua lua vim.lsp.buf.format()
]]

require('onedark').load()
