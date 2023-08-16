local map = vim.keymap.set
local silent = { silent = true }

-- Close windows
map("n", "Q", "<cmd>close<cr>", silent)

-- Move current line / block with Alt-j/k ala vscode.
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down", noremap = true, silent = true })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up", noremap = true, silent = true })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down", noremap = true, silent = true })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up", noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down", noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", noremap = true, silent = true })

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Stay centered jumping between search results
map("n", "n", "nzzzv", silent)
map("n", "N", "Nzzzv", silent)

-- Fix cursor position after joining lines
map("n", "J", "mzJ`z", silent)

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Ctrl+V for pasting from system clipboard
map("i", "<c-v>", "<c-r>+", silent)

-- Search for visually selected text
map("v", "//", 'y/<C-R>"<cr>', silent)

-- Have the same buffer on clipboard for multiple pastes
map("v", "p", "pgvy", silent)

-- Delete to blackhole register
map({ "n", "x" }, "\\d", '"_d', { desc = "Delete to blackhole register" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Make the dot command work as expected in visual mode
-- https://www.reddit.com/r/vim/comments/3y2mgt/
map("v", ".", "<cmd>norm .<cr>", silent)

-- Trouble mappings
map("n", "<C-q>", "<cmd>TroubleToggle<cr>", silent)
map("n", "]q", function()
	require("trouble").next({ skip_groups = true, jump = true })
end, silent)
map("n", "[q", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end, silent)
map("n", "]Q", function()
	require("trouble").last({ skip_groups = true, jump = true })
end, silent)
map("n", "[Q", function()
	require("trouble").first({ skip_groups = true, jump = true })
end, silent)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- smart deletion, dd
-- It solves the issue, where you want to delete empty line, but dd will override you last yank.
-- Code above will check if u are deleting empty line, if so - use black hole register.
-- [src: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3]
local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })
