return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				sh = { "shfmt" },
				php = { "php_cs_fixer" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		-- Custom function to run blade-formatter, this blade formatter installed by npm.
		local function format_blade()
			local file_path = vim.fn.expand("%:p")
			local cmd = "blade-formatter --write " .. file_path
			vim.fn.system(cmd)
			vim.cmd("edit") -- reloading buffer.
		end
		-- Set up an autocommand to format Blade files on save
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*.blade.php",
			callback = format_blade,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
