return {
	"akinsho/bufferline.nvim",
	priority = 1000,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "v3.*",
	opts = {
		options = {
			mode = "tabs",
		},
	},

	config = function()
		vim.opt.termguicolors = true
		local status_safe, bufferline = pcall(require, "bufferline")
		if not status_safe then
			return
		end
		local opts = {
			highlights = {
				tab_close = {
					fg = "#FF4242",
				},
				close_button = {
					fg = "#AE5D5D",
				},
				close_button_selected = {
					fg = "#FF5454",
				},
				buffer_selected = {
					fg = "#F05F5F",
				},
			},

			options = {
				mode = "buffers",
				--		numbers = "both",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator_icon = "▎",
				buffer_close_icon = "",
				modified_icon = "",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				name_formatter = function(buf)
					if buf.name:match("%.md") then
						return vim.fn.fnamemodify(buf.name, ":t:r")
					end
				end,

				offsets = {
					{
						filetype = "NvimTree",
						separator = true,
					},
				},

				max_name_length = 8,
				max_prefix_length = 10,
				tab_size = 12,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					return "(" .. count .. ")"
				end,
				custom_filter = function(buf_number, buf_numbers)
					if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
						return true
					end
					if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
						return true
					end
					if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
						return true
					end
					if buf_numbers[1] ~= buf_number then
						return true
					end
				end,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_buffer_default_icon = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "slant",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
			}, -- akhir dari option!
		}

		bufferline.setup(opts) --akhir dari require
	end,
}
