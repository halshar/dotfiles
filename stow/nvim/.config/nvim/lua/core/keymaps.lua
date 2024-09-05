vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- function to map keys with descriptions
local function map(mode, key, cmd, desc)
	local opts = { noremap = true, silent = true }
	if desc then
		opts.desc = desc
	end
	vim.keymap.set(mode, key, cmd, opts)
end

-- function to toggle window zoom
local isZoomed = false
local function toggle_window_zoom()
	if isZoomed then
		vim.cmd("wincmd =") -- restore window sizes
		isZoomed = false
	else
		vim.cmd("wincmd |") -- maximize horizontally
		vim.cmd("wincmd _") -- maximize vertically
		isZoomed = true
	end
end

-- window management
map("n", "<C-h>", "<C-w>h", "Move to window left")
map("n", "<C-j>", "<C-w>j", "Move to window down")
map("n", "<C-k>", "<C-w>k", "Move to window up")
map("n", "<C-l>", "<C-w>l", "Move to window right")
map("n", "<leader>mh", "<cmd>wincmd H<CR>", "Move window to horizontal split left")
map("n", "<leader>mj", "<cmd>wincmd J<CR>", "Move window to horizontal split down")
map("n", "<leader>mk", "<cmd>wincmd K<CR>", "Move window to vertical split up")
map("n", "<leader>ml", "<cmd>wincmd L<CR>", "Move window to vertical split right")
map("n", "<leader>wh", "<C-w>_", "Maximize horizontal window")
map("n", "<leader>we", "<C-w>=", "Resize all windows equally")
map("n", "<leader>wv", "<C-w>|", "Maximize vertical window")
map("n", "<leader>ww", toggle_window_zoom, "Toggle window zoom")
map("n", "<leader>o", "<C-w>o", "Close other windows")

-- buffer and file management
map("n", "<leader>hh", "<cmd>nohlsearch<CR>", "Clear search highlights")
map("n", "<leader>u", "<cmd>bunload<CR>", "Unload current buffer")
map("n", "<leader>sl", "<C-^>", "Switch to the alternate file")
map("n", "<leader>wt", "<cmd>set wrap!<CR>", "Toggle line wrapping")
map("n", "<leader>nt", "<cmd>set rnu!<CR>", "Toggle relative line numbers")
map("v", "J", ":m '>+1<CR>gv=gv", "Move selected text down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected text up")
map({ "n", "v" }, "<Space>", "<Nop>", "Disable space key")

-- clipboard management
map({ "n", "v" }, "<leader>sy", '"+y', "Copy to system clipboard")
map({ "n", "v" }, "<leader>sd", '"+d', "Cut to system clipboard")
map("n", "<leader>sp", '"+p', "Paste after cursor from system clipboard")
map("n", "<leader>sP", '"+P', "Paste before cursor from system clipboard")

-- terminal management
map("n", "<leader>to", "<cmd>terminal<CR>", "Open terminal in a new window")
map("n", "<leader>th", "<cmd>split | terminal<CR>", "Open terminal in a horizontal split")
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", "Open terminal in a vertical split")
map("n", "<leader>tn", "<cmd>tabnew | terminal<CR>", "Open terminal in a new tab")

-- vimdiff management
map("n", "<leader>wd", "<cmd>windo diffthis<CR>", "Enable diff mode in all windows")
map("n", "<leader>wo", "<cmd>windo diffoff<CR>", "Disable diff mode in all windows")

-- miscellaneous
map("n", "<leader>bl", "<cmd>Lazy check<CR>", "Check Lazy updates")
