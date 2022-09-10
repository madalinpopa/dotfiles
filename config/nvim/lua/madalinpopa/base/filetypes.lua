------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------

------------------------------------------------------
-- PYTHON
------------------------------------------------------
-- Number of spaces that a pre-existing tab is equal to.
vim.cmd([[au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4]])

-- spaces for indents
vim.cmd([[au BufRead,BufNewFile *.py,*pyw set shiftwidth=4]])
vim.cmd([[au BufRead,BufNewFile *.py,*.pyw set expandtab]])
vim.cmd([[au BufRead,BufNewFile *.py set softtabstop=4]])

-- Use the below highlight group when displaying bad whitespace is desired.
vim.cmd([[highlight BadWhitespace ctermbg=red guibg=red]])

-- Display tabs at the beginning of a line in Python mode as bad.
vim.cmd([[au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/]])

-- Make trailing whitespace be flagged as bad.
vim.cmd([[au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/]])

-- Wrap text after a certain number of characters
vim.cmd([[au BufRead,BufNewFile *.py,*.pyw, set textwidth=100]])

-- Use UNIX (\n) line endings.
vim.cmd([[au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix]])

------------------------------------------------------
-- JAVASCRIPT
------------------------------------------------------
-- Number of spaces that a pre-existing tab is equal to.
vim.cmd([[au BufRead,BufNewFile *js,*json set tabstop=2]])

-- spaces for indents
vim.cmd([[au BufRead,BufNewFile *.js,*json set shiftwidth=2]])
vim.cmd([[au BufRead,BufNewFile *.js,*.json set expandtab]])
vim.cmd([[au BufRead,BufNewFile *.js set softtabstop=2]])

------------------------------------------------------
-- HTML
------------------------------------------------------
-- Number of spaces that a pre-existing tab is equal to.
vim.cmd([[au BufRead,BufNewFile *html set tabstop=2]])

-- spaces for indents
vim.cmd([[au BufRead,BufNewFile *.html set shiftwidth=2]])
vim.cmd([[au BufRead,BufNewFile *.html set expandtab]])
vim.cmd([[au BufRead,BufNewFile *.html set softtabstop=2]])

------------------------------------------------------
-- LUA
------------------------------------------------------
-- Number of spaces that a pre-existing tab is equal to.
vim.cmd([[au BufRead,BufNewFile *lua set tabstop=2]])

-- spaces for indents
vim.cmd([[au BufRead,BufNewFile *.lua set shiftwidth=2]])
vim.cmd([[au BufRead,BufNewFile *.lua set expandtab]])
vim.cmd([[au BufRead,BufNewFile *.lua set softtabstop=2]])
