return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		local options = {

			highlight = { enable = true },
			indent = { enable = true },
			textobjects = { enable = true },
			autotag = { enable = true },

			ensure_installed = {
				"json",
				"javascript",
				"html",
				"css",
				"markdown",
				"bash",
				"lua",
				"vim",
				"c",
				"php",
				"graphql",
			},

			incremental_selection = {
				enable = true,
			},
		}

		-- configure treesitter
		treesitter.setup(options)
	end,
}
