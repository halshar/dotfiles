local set = vim.opt

set.termguicolors = true
set.hidden = true
set.cursorline = true
set.number = true
set.relativenumber = true
set.scrolloff = 5

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.splitbelow = true
set.splitright = true

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

set.clipboard = "unnamedplus"
