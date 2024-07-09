local fmt = string.format

-- Return the current mode
--- @return string
local function get_mode()
	return fmt("%s ", vim.api.nvim_get_mode().mode)
end

-- Return [[RO]] if the current buffer is readonly else empty string
--- @return string
local function get_readonly()
	if vim.bo.readonly then
		return "[RO]"
	end
	return ""
end

-- Return [[+]] if the current buffer is modified,
-- [[-]] if it's unmodifiable else empty string
--- @return string
local function get_modified()
	if vim.bo.modified then
		return "[+]"
	end
	if not vim.bo.modifiable then
		return "[-]"
	end
	return ""
end

-- Return the entire file path which includes current working directory,
-- buffer name, and modifiable flags
--- @return string
local function get_filepath()
	local path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~")
	local flags = table.concat({ get_readonly(), get_modified() })
	if flags ~= "" then
		flags = " " .. flags
	end
	return fmt("%s%s ", path, flags)
end

-- Return the branch name if within git repo else blank string
--- @return string
local function get_branch()
	local branch = vim.b.gitsigns_head
	if branch == "" or branch == nil then
		return ""
	end
	return fmt("(%s)", branch)
end

-- Return the prefix and the diagnostic count
-- prefix can be either E for Error, W for Warning, or H for Hint
--- @param prefix string
--- @param severity integer
--- @return string
local function get_lsp_diagnostics(prefix, severity)
	if not vim.lsp then
		return ""
	end
	local count = vim.diagnostic.count(0, { severity = severity })[severity]
	if count == nil then
		return ""
	end
	return fmt("%s:%d ", prefix, count)
end

-- Return the error diagnostics
--- @return string
local function get_diagnostics_error()
	return get_lsp_diagnostics("E", vim.diagnostic.severity.ERROR)
end

-- Return the warning diagnostics
--- @return string
local function get_diagnostics_warning()
	return get_lsp_diagnostics("W", vim.diagnostic.severity.WARN)
end

-- Return the hint diagnostics
--- @return string
local function get_diagnostics_hint()
	return get_lsp_diagnostics("H", vim.diagnostic.severity.HINT)
end

-- Return the current filetype
--- @return string
local function get_filetype()
	return fmt("%s ", vim.bo.filetype)
end

-- Return padded string
--- @return string
local function pad(c, m)
	local padch = "·"
	return string.rep(padch, string.len(tostring(m)) - string.len(tostring(c)))
end

-- Return current row position
--- @return string
local function get_row()
	local nbline = vim.fn.line("$")
	local line = vim.fn.line(".")
	return fmt("%s%d/%d", pad(line, nbline), line, nbline)
end

-- Return current column position
--- @return string
local function get_column()
	local nbcol = vim.fn.col("$") - 1
	local col = vim.fn.col(".")
	return fmt("%s%d/%s%d", pad(col, 100), col, pad(nbcol, 100), nbcol)
end

-- Return current buffer position in percentage
--- @return string
local function get_percent()
	local nb_lines = vim.fn.line("$")
	local line = vim.fn.line(".")
	local percent = math.floor(line * 100 / nb_lines)
	return fmt("%s%d%%%%", pad(percent, 100), percent)
end

-- Return the current row, column, and buffer percentage
--- @return string
local function get_line()
	return fmt("%s %s %s", get_row(), get_column(), get_percent())
end

-- Return the entire statusline
--- @return string
StatusLine = function()
	local statusline = {
		get_mode(),
		get_filepath(),
		get_branch(),
		"%=",
		get_diagnostics_error(),
		get_diagnostics_warning(),
		get_diagnostics_hint(),
		get_filetype(),
		get_line(),
	}
	return table.concat(statusline)
end

vim.opt.statusline = "%!v:lua.StatusLine()"
