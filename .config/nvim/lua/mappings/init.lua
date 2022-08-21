local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('n', '<leader>h', ':nohlsearch<CR>', opts)
map('n', '<leader>n', ':cnext<CR>', opts)
map('n', '<leader>p', ':cprevious<CR>', opts)
map('n', '<leader>c', ':cclose<CR>', opts)

map('n', '<leader>gr', ':GoRun %<CR>', opts)
map('n', '<leader>gb', ':GoBuild<CR>', opts)

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
