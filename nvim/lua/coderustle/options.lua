------------------------------------------------------
-- Author: Madalin Popa
--
-- Email: madalin@coderustle.ro
------------------------------------------------------


-- Global options
------------------------------------------------------

-- Set default leader
vim.g.mapleader = ","

-- Set relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tabs to use spaces
vim.opt.expandtab = true

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 300
vim.opt.timeoutlen = 150

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Set default tab stop
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Number of spaces to use for each step
vim.opt.shiftwidth = 4

-- Disable swapfile
vim.opt.swapfile = false

-- Set the number of lines for scroll
vim.opt.scrolloff = 8

vim.opt.colorcolumn = ""

-- Set the fold options
vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 99
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldcolumn = '0'

vim.opt.termguicolors = true

-- Set the background color for cursor line
vim.opt.cursorline = true

-- Netrw settings
-- Safe function to get gitignore patterns
local function get_gitignore_patterns()
    local ok, patterns = pcall(function() 
        return vim.fn["netrw_gitignore#Hide"]() 
    end)
    return ok and patterns or ""
end

-- Define custom hide patterns with proper Netrw pattern syntax
local hide_patterns = {
    '.*_templ\\.txt$',
    '.*_templ\\.go$'
}

-- Combine patterns safely
local gitignore_patterns = get_gitignore_patterns()
local pattern_string = table.concat(hide_patterns, ',')
local hidden_files_pattern = [[\(^\|\s\s\)\zs\.\S\+]]

-- Set Netrw list hide with proper concatenation
if pattern_string ~= "" then
    vim.g.netrw_list_hide = gitignore_patterns .. "," .. hidden_files_pattern .. "," .. pattern_string
else
    vim.g.netrw_list_hide = gitignore_patterns .. "," .. hidden_files_pattern
end
