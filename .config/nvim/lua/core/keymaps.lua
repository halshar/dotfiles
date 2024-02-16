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
map("n", "<leader>nt", "<cmd>set rnu!<CR>", opts)
map("n", "<leader>to", "<cmd>terminal<CR>", opts)
map("n", "<leader>th", "<cmd>split | terminal<CR>", opts)
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", opts)
map("n", "<leader>sl", "<C-^>", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map({ "n", "v" }, "<Space>", "<Nop>", opts)

-- diagnostics
map("n", "<leader>de", vim.diagnostic.open_float, opts)
map("n", "<leader>dn", vim.diagnostic.goto_next, opts)
map("n", "<leader>dp", vim.diagnostic.goto_prev, opts)

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
map("n", "<leader>fu", "<cmd>Telescope undo<CR>", opts)

-- lazy
map("n", "<leader>lc", "<cmd>Lazy check<CR>", opts)

-- diffview
map("n", "<leader>do", "<cmd>DiffviewOpen<CR>", opts)
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", opts)
map("n", "<leader>dt", "<cmd>DiffviewToggleFiles<CR>", opts)
map("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", opts)

-- trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", opts)
map("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
map("n", "<leader>tl", "<cmd>TroubleToggle loclist<CR>", opts)
map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<CR>", opts)
map("n", "gR", "<cmd>TroubleToggle lsp_references<CR>", opts)
map("n", "gI", "<cmd>TroubleToggle lsp_implementations<CR>", opts)
map("n", "gd", "<cmd>TroubleToggle lsp_definitions<CR>", opts)
map("n", "gD", "<cmd>TroubleToggle lsp_type_definitions<CR>", opts)

-- oil
map("n", "<leader>fo", "<CMD>Oil --float<CR>", opts)

-- gopher
map("n", "<leader>gj", "<CMD>GoTagAdd json<CR>", opts)
map("n", "<leader>gy", "<CMD>GoTagAdd yaml<CR>", opts)
map("n", "<leader>gT", "<CMD>GoTestsAll<CR>", opts)
map("n", "<leader>gt", "<CMD>GoTestAdd<CR>", opts)
map("n", "<leader>ge", "<CMD>GoIfErr<CR>", opts)
map("n", "<leader>gc", "<CMD>GoCmt<CR>", opts)
