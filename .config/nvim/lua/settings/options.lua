local options = {
	mouse = "a",
	wrap = true,
	breakindent = true,
	autoindent = true,
	hidden = true,
	relativenumber = true,
	number = true,
	textwidth = 120,
	scrolloff = 9,
	numberwidth = 4,
	showmode = false,
	updatetime = 250,
	cursorline = true,
	signcolumn = "yes:1",
	termguicolors = true,
	whichwrap = vim.opt.whichwrap + "<>hl",
	clipboard = "unnamedplus",
	syntax = "on",
	shiftwidth = 2,
	tabstop = 4,
	smarttab = true,
	linebreak = true,
	filetype = "on",
	splitright = true, -- split vertical window to the right
	-- formatoption = 1,
}

-- set vim.opt safely.
local function set_option(name, value)
	vim.opt[name] = value
end

for option, value in pairs(options) do
	local success, err = pcall(set_option, option, value)
	if not success then
		print("nvim/lua/settings/options.lua: " .. err)
	end
end
