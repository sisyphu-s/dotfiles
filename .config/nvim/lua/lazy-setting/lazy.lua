-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Get the path and filename of the current script

local status_safe, lazy = pcall(require, "lazy")
if not status_safe then
	print(lazy)
	return
end

local options = {
	checker = { enabled = true, notify = false },
	change_detection = { enabled = true, notify = false },
}

local myLibrary = { { import = "plugins" }, { import = "plugins.lsp" } }

-- Setup lazy.nvim
lazy.setup(myLibrary, options)
