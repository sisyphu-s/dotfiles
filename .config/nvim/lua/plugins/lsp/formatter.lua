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
				graphql = { "prettier" },
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

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })

		-- Custom function to run blade-formatter
		local function format_blade()
			local file_name = vim.fn.expand("%:t") -- Get the file name
			if file_name:match("%.blade%.php$") then
				local file_path = vim.fn.expand("%:p")
				local cmd = "blade-formatter --write " .. file_path
				vim.cmd("silent! write")
				vim.fn.system(cmd)
				vim.cmd("edit") -- Reloading buffer.
			end
		end

		-- Create a command to format Blade files
		vim.api.nvim_create_user_command("FormatBlade", format_blade, { nargs = 0 })
		-- Optionally, you can bind this command to a key combination
		vim.api.nvim_set_keymap("n", "fb", ":FormatBlade<CR>", { noremap = true, silent = true })
	end,
}
