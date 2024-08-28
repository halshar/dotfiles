local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- general
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>o", "<C-w>o", opts)
map("n", "<leader>hh", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>u", "<cmd>bunload<CR>", opts)
map("n", "<leader>wt", "<cmd>set wrap!<CR>", opts)
map("n", "<leader>nt", "<cmd>set rnu!<CR>", opts)
map("n", "<leader>to", "<cmd>terminal<CR>", opts)
map("n", "<leader>th", "<cmd>split | terminal<CR>", opts)
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", opts)
map("n", "<leader>tn", "<cmd>tabnew | terminal<CR>", opts)
map("n", "<leader>sl", "<C-^>", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map({ "n", "v" }, "<Space>", "<Nop>", opts)

-- clipboard
map({ "n", "v" }, "<leader>sy", '"+y')
map({ "n", "v" }, "<leader>sd", '"+d')
map("n", "<leader>sp", '"+p')
map("n", "<leader>sP", '"+P')

-- vimdiff
map("n", "<leader>wd", "<cmd>windo diffthis<CR>", opts)
map("n", "<leader>wo", "<cmd>windo diffoff<CR>", opts)

-- lazy
map("n", "<leader>bl", "<cmd>Lazy check<CR>", opts)
