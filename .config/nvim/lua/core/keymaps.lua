local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>o", "<C-w>o", opts)
map("n", "<leader>hh", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
map("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", opts)
map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>fm", "<cmd>Telescope spell_suggest<CR>", opts)
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts)
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>a", "<cmd>bunload<CR>", opts)
map("n", "<leader>do", "<cmd>DiffviewOpen<CR>", opts)
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", opts)
map("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>", opts)
map("n", "<leader>dt", "<cmd>DiffviewToggleFiles<CR>", opts)
map("n", "<leader>lc", "<cmd>Lazy check<CR>", opts)
