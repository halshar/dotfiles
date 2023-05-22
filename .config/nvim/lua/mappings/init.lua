local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<leader>hh', '<cmd>nohlsearch<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>u', '<cmd>UndotreeToggle<CR>', opts)
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>a', '<cmd>bufdo bd<CR>', opts)
map('n', '<leader>do', '<cmd>DiffviewOpen<CR>', opts)
map('n', '<leader>dc', '<cmd>DiffviewClose<CR>', opts)
map('n', '<leader>dr', '<cmd>DiffviewRefresh<CR>', opts)
map('n', '<leader>dt', '<cmd>DiffviewToggleFiles<CR>', opts)
