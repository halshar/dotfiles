local set = vim.opt

set.termguicolors = true
set.hidden = true
set.cursorline = true
set.number = true
set.relativenumber = true
set.undofile = true
set.ignorecase = true
set.smartcase = true
set.smartindent = true
set.scrolloff = 11
set.colorcolumn = "80"
set.signcolumn = "yes"
set.completeopt = "menuone,noselect"
set.spelllang = { "en" }

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.splitbelow = true
set.splitright = true

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

set.clipboard = "unnamedplus"
