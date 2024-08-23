return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	version = "v1.4.0",
	config = function()
		local status_safe, ufo = pcall(require, "ufo")
		if not status_safe then
			return
		end

		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		-- zc untuk menutup fold, dan z0 untuk membuka.
		-- zC untuk menutup semua fold, dan zO untuk membuka semua fold.
		--
		-- Bindings for folding commands
		vim.api.nvim_set_keymap("n", "zk", "zc", { noremap = true, silent = true }) -- Bind 'zk' to 'zc'
		vim.api.nvim_set_keymap("n", "zK", "zC", { noremap = true, silent = true }) -- Bind 'zK' to 'zC'

		local config_fold = {
			open_fold_hl_timeout = 150,
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end,
		}

		ufo.setup(config_fold)
	end,
}
