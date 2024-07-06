return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		vim.opt.list = true
		vim.opt.listchars:append("eol:↴")
		vim.opt.listchars:append("tab:│ ")
		local status_safe, ibl = pcall(require, "ibl")
		if not status_safe then
			return
		end

		ibl.setup({
			scope = { enabled = false },
		})
	end,
}
