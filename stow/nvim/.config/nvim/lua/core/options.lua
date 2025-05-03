local set = vim.opt
local gset = vim.g

gset.loaded_python3_provider = 0
gset.loaded_ruby_provider = 0
gset.loaded_perl_provider = 0
gset.loaded_node_provider = 0

set.termguicolors = true
set.hidden = true
set.cursorline = true
set.number = true
set.relativenumber = true
set.undofile = true
set.ignorecase = true
set.smartcase = true
set.smartindent = true
set.showmode = false
set.laststatus = 3
set.scrolloff = 11
set.colorcolumn = "80"
set.signcolumn = "yes"
set.completeopt = "menuone,noselect"
set.spelllang = { "en" }
set.winborder = "rounded"

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.splitbelow = true
set.splitright = true

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

set.list = true
set.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
