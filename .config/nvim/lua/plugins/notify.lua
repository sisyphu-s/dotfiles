return {
	"rcarriga/nvim-notify",

	config = function()
		local opts = {
			stages = "fade_in_slide_out",
			timeout = 3000,
			render = "wrapped-compact",
			max_width = function()
				return 60
			end,
		}

		require("notify").history()
		vim.notify = require("notify")
		vim.notify.setup(opts)
		vim.notify("semangat romi", "info")
	end,
}
