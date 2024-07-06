return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local status_safe, lualine = pcall(require, "lualine")
		if not status_safe then
			return
		end

		-- get lualine nightfly theme
		local ayu_mirage = require("lualine.themes.ayu_mirage")

		-- new colors for theme
		local new_colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			black = "#000000",
		}

		-- change nightlfy theme colors
		ayu_mirage.normal.a.bg = new_colors.blue
		ayu_mirage.insert.a.bg = new_colors.green
		ayu_mirage.visual.a.bg = new_colors.violet
		ayu_mirage.command = {
			a = {
				gui = "bold",
				bg = new_colors.yellow,
				fg = new_colors.black, -- black
			},
		}

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = ayu_mirage,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})

		--theme yang ada:
		--auto
		--16color
		--ayu_dark
		--ayu_light
		--ayu_mirage
		--ayu
		--base16
		--codedark
		--dracula
		--everforest
		--gruvbox_dark
		--gruvbox_light
		--gruvbox
		--gruvbox-material
		--horizon
		--iceberg_dark
		--iceberg_light
		--iceberg
		--jellybeans
		--material
		--palenight
		--papercolor_dark
		--modus-vivendi
		--molokai
		--moonfly
		--nightfly
		--nord
		--OceanicNext
		--powerline_dark
		--powerline
	end,
}
