return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
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

		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Enable treesitter highlighting, indentation, and folds",
			callback = function(event)
				local ft = event.match
				local buf = event.buf
				local lang = vim.treesitter.language.get_lang(ft) or ft

				-- disable treesitter for ignored filetypes
				if vim.tbl_contains(ignore_filetypes, ft) then
					return
				end

				-- install and active treesitter parser
				local parser_available, _ = vim.treesitter.language.add(lang)
				if not parser_available then
					local available_parsers = ts.get_available()
					local parser_exists = vim.tbl_contains(available_parsers, lang)

					if parser_exists then
						ts.install({ lang })
					else
						return
					end
				end

				-- enable highlighting
				local highlight_ok, _ = pcall(vim.treesitter.start, buf, lang)
				if not highlight_ok then
					return
				end

				-- enable indentation
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- enable folds
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
			end,
		})
	end,
}
