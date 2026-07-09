vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		-- update all installed parsers whenever nvim-treesitter is updated
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

local ts = require("nvim-treesitter")
local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
local ignore_filetypes = {
	"checkhealth",
	"fidget",
	"fzf",
	"lazy",
	"lazy_backdrop",
	"mason",
	"oil",
}

-- enable treesitter features for a buffer
local function attach_treesitter(buf, lang)
	-- load the parser if its available
	if not vim.treesitter.language.add(lang) then
		return
	end

	-- enable syntax highlighting
	local ok = pcall(vim.treesitter.start, buf, lang)
	if not ok then
		return
	end

	-- enable treesitter indentation only if the language supports it
	if vim.treesitter.query.get(lang, "indents") then
		vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end

	-- enable folds
	vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.wo.foldmethod = "expr"
end

local available_parsers = ts.get_available()
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	desc = "Enable treesitter highlighting, indentation, and folds",
	callback = function(event)
		local ft = event.match
		local buf = event.buf

		-- disable treesitter for ignored filetypes
		if vim.tbl_contains(ignore_filetypes, ft) then
			return
		end

		-- if the parser is already installed then attach immediately
		local lang = vim.treesitter.language.get_lang(ft) or ft
		if vim.treesitter.language.add(lang) then
			attach_treesitter(buf, lang)
			return
		end

		-- skip languages without an available parser
		if not vim.tbl_contains(available_parsers, lang) then
			return
		end

		-- install the parser on demand then attach it
		ts.install(lang):await(function()
			attach_treesitter(buf, lang)
		end)
	end,
})
