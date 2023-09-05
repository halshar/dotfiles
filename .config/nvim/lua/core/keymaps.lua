local map = vim.api.nvim_set_keymap
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

-- lazy
map("n", "<leader>lc", "<cmd>Lazy check<CR>", opts)

-- diffview
map("n", "<leader>do", "<cmd>DiffviewOpen<CR>", opts)
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", opts)
map("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>", opts)
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
