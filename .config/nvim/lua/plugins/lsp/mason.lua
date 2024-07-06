return {
	"williamboman/mason.nvim",

	dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	config = function()
		-- import mason
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local mason_extensions = {}
		local function insert_extensions(extensionsTable)
			for _, extensionName in ipairs(extensionsTable) do
				table.insert(mason_extensions, extensionName)
			end
		end

		local completions = {
			"tsserver",
			"html",
			"cssls",
			"intelephense",
			"pyright",
			"lua-language-server",
			"typescript-language-server",
		}

		local formatter = {
			"prettier",
			"stylua",
			"isort",
			"black",
			"shfmt",
			"php-cs-fixer",
			"pylint",
			"eslint_d",
		}

		insert_extensions(formatter)
		insert_extensions(completions)

		mason_tool_installer.setup({
			ensure_installed = mason_extensions,
		})
	end,
}
