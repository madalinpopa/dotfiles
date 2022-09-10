------------------------------------------------------
-- Author: Madalin Popa
-- Email: contact@madalinpopa.com
------------------------------------------------------

------------------------------------------------------
-- NEOVIM API ALIASSES
------------------------------------------------------
local cmd = vim.cmd     		-- execute Vim commands
local exec = vim.api.nvim_exec  	-- execute Vimscript
-- local fn = vim.fn       		-- call Vim functions
local g = vim.g         		-- global variables
local o = vim.o         		-- global options
local b = vim.bo        		-- buffer-scoped options
local w = vim.wo        		-- windows-scoped options

------------------------------------------------------
-- VARIABLES
------------------------------------------------------
g.mapleader = ',' 			-- change leader to comma
g.markdown_folding = 1      		-- enable folding for markdown
g.markdown_minlines = 100   		-- increase the markdown code fence lines
g.vim_json_conceal=0        		-- show quotes in json file
-- g.python3_host_prog = "/usr/bin/python3.8"
-- g.node_host_prog = "/usr/local/bin/node"

------------------------------------------------------
-- OPTIONS
------------------------------------------------------

o.mouse = 'a'				            -- enable mouse support
o.clipboard = 'unnamedplus'		  -- copy/paste to system clipboard
b.swapfile = false			        -- disable swapfile
o.encoding ='UTF-8'			        -- set default encoding type
o.syntax = 'enable'			        -- enable syntax highlight
w.number = true				          -- show line number
o.showmatch = true          		-- highlight matching parenthesis
w.foldmethod = 'marker'     		-- enable folding (default 'foldmarker')
w.colorcolumn = '120'       		-- line lenght marker at 80 columns
o.splitright = true         		-- vertical split to the right
o.splitbelow = true         		-- orizontal split to the bottom
o.ignorecase = true         		-- ignore case letters when search
o.smartcase = true          		-- ignore lowercase for the whole pattern
o.hidden = true        			    -- enable background buffers
o.history = 100                 -- remember n lines in history
o.lazyredraw = true             -- faster scrolling
b.synmaxcol = 240               -- max column for syntax highlight
o.termguicolors = true      		-- enable 24-bit RGB colors
o.pumheight=10              		-- makes popup menu smaller
b.fileencoding='UTF-8'      		-- set the encoding file type for buffer
o.ruler = true              		-- show the cursor position all the time
o.cmdheight=2               		-- more space for displaying messages
w.conceallevel=1  			        -- so that I can see `` in markdown files. Defaults is 0
b.tabstop=2                 		-- insert 2 spaces for a tab
b.shiftwidth=2              		-- change the number of space characters inserted for indentation
o.smarttab=true             		-- makes tabbing smarter will realize you have 2 vs 4
b.expandtab=true            		-- converts tabs to spaces
b.smartindent=true          		-- makes indenting smart
b.autoindent=true           		-- copy the indent line from the above
w.number=true               		-- line numbers
w.relativenumber=true       		-- set relative number
w.cursorline=true           		-- enable highlighting of the current line
o.background='dark'         		-- tell vim what the background color looks like
o.showtabline=2             		-- always show tabs
o.showmode=true            		-- we don't need to see things like -- INSERT -- anymore
o.backup=false              		-- no backup file when writing
o.writebackup=false         		-- no backup file writing
o.updatetime=300            		-- faster completion
o.timeoutlen=500            		-- by default timeoutlen is 1000 ms
b.textwidth=120				-- hard wrap
w.colorcolumn="120"			-- display a color column for text width
w.foldenable=false			-- all fold to be open by default


------------------------------------------------------
-- COMMANDS
------------------------------------------------------
-- format options
cmd([[set formatoptions-=tcroa]])

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight colorcolumn
cmd([[au VimEnter * highlight ColorColumn ctermbg=238 guibg=238]])

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

