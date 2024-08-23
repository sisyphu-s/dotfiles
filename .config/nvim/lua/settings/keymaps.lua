--command yang diperuntukan untuk nvim!
local normal_map = function(command, exec)
	vim.keymap.set("n", command, ":" .. exec .. "<CR>", { noremap = true })
end

local visual_map = function(command, exec)
	vim.keymap.set("v", command, ":" .. exec .. "<CR>", { noremap = true })
end

local insert_map = function(command, exec)
	vim.keymap.set("i", command, "<esc> " .. exec .. "<CR>", { noremap = true })
end

local normal_ctrl_map = function(command, exec)
	normal_map("<C-" .. command .. ">", exec)
end

local normal_alt_map = function(command, exec)
	normal_map("<A-" .. command .. ">", exec)
end

local insert_alt_map = function(command, exec)
	insert_map("<A-" .. command .. ">", exec)
end

local insert_ctrl_map = function(command, exec)
	insert_map("<C-" .. command .. ">", exec)
end

-- Normal mode mappings
normal_map("H", "<<")
normal_map("zm", "BufferLinePick")
normal_map("L", ">>")
normal_map("zz", "/clean-search-qwerty")
normal_map("tt", "Telescope") --plugin
normal_map("nt", "Telescope notify") --plugin
normal_map("qq", "w! | bd") --plugin
normal_map("Q", "wq!")
normal_map("ff", "w!") --plugin

normal_ctrl_map("h", "wincmd h") -- Move to the left split ketika window editor di split.
normal_ctrl_map("j", "wincmd j") -- Move to the below split
normal_ctrl_map("k", "wincmd k") -- Move to the above split
normal_ctrl_map("l", "wincmd l") -- Move to the right split

normal_ctrl_map("Up", "resize +2")
normal_ctrl_map("Down", "resize -2")
normal_ctrl_map("Left", "vertical resize -2")
normal_ctrl_map("Right", "vertical resize +2")

-- command untuk menselect semua nama yang sama dan merubahnya:
-- :% s/words/newwords
-- fungsi untuk membuka dan menutup tree pada mode normal dan insert
normal_alt_map("b", "NvimTreeToggle") --plugin
insert_alt_map("b", "NvimTreeToggle") --plugin
-- fungsi untuk pindah tab pada mode normal dan insert
normal_alt_map("l", "BufferLineCycleNext") --plugin
normal_alt_map("h", "BufferLineCyclePrev") --plugin
insert_alt_map("l", ":BufferLineCycleNext") --plugin
insert_alt_map("h", ":BufferLineCyclePrev") --plugin

-- insert_map("jk", ";") --back to normal mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })
normal_ctrl_map("p", "Telescope find_files") ----plugin
insert_ctrl_map("p", ":Telescope find_files") ----plugin

visual_map("H", "<<")
visual_map("L", ">>")
visual_map("jk", "<esc>")
