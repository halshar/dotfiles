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

-- telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
map("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", opts)
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>fm", "<cmd>Telescope spell_suggest<CR>", opts)
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- vimdiff
map("n", "<leader>wd", "<cmd>windo diffthis<CR>", opts)
map("n", "<leader>wo", "<cmd>windo diffoff<CR>", opts)

-- diffview
map("n", "<leader>go", "<cmd>DiffviewOpen<CR>", opts)
map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", opts)
map("n", "<leader>gt", "<cmd>DiffviewToggleFiles<CR>", opts)
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", opts)

-- trouble
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>", opts)
map("n", "<leader>tw", "<cmd>Trouble diagnostics toggle focus=true<CR>", opts)
map("n", "<leader>tl", "<cmd>Trouble loclist toggle focus=true<CR>", opts)
map("n", "<leader>tq", "<cmd>Trouble qflist toggle focus=true<CR>", opts)
map("n", "gr", "<cmd>Trouble lsp_references focus=true win.position=bottom<CR>", opts)
map("n", "gd", "<cmd>Trouble lsp_definitions focus=true win.position=bottom<CR>", opts)

-- undotree
map("n", "<leader>bu", "<CMD>UndotreeToggle<CR>", opts)

-- lazy
map("n", "<leader>bl", "<cmd>Lazy check<CR>", opts)
