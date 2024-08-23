require("settings.keymaps")
require("settings.options")
require("lazy-setting.lazy")

-- Assuming this Lua script is loaded when a PHP file is opened
if vim.bo.filetype == "php" then
	vim.b.coc_root_patterns = { ".git", ".env", "composer.json", "artisan" }
end

-- Set highlight for LineNr
-- vim.cmd([[
--   hi LineNr term=bold cterm=bold ctermfg=2 guifg=#0BA54E
-- ]])

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.blade.php",
	command = "set filetype=php",
})
-- in my settings
-- Set highlight for CursorLineNr
vim.cmd([[
  hi CursorLineNr guifg=#26C45C
]])
