local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")

-- Borderless terminal
vim.keymap.set("n", "<C-/>", function()
	Util.terminal(nil, { border = "none" })
end, { desc = "Term with border" })

-- Borderless lazygit
vim.keymap.set("n", "<leader>gg", function()
	Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "none" })
end, { desc = "Lazygit (root dir)" })

keymap.del({ "n", "i", "v" }, "<A-j>")
keymap.del({ "n", "i", "v" }, "<A-k>")
keymap.del("n", "<C-Left>")
keymap.del("n", "<C-Down>")
keymap.del("n", "<C-Up>")
keymap.del("n", "<C-Right>")

local set_keymap = vim.api.nvim_set_keymap

-- Split windows
keymap.set("n", "ss", ":vsplit<Return>", opts)
keymap.set("n", "sv", ":split<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- package-info keymaps
set_keymap(
	"n",
	"<leader>cpt",
	"<cmd>lua require('package-info').toggle()<cr>",
	{ silent = true, noremap = true, desc = "Toggle" }
)
set_keymap(
	"n",
	"<leader>cpd",
	"<cmd>lua require('package-info').delete()<cr>",
	{ silent = true, noremap = true, desc = "Delete package" }
)
set_keymap(
	"n",
	"<leader>cpu",
	"<cmd>lua require('package-info').update()<cr>",
	{ silent = true, noremap = true, desc = "Update package" }
)
set_keymap(
	"n",
	"<leader>cpi",
	"<cmd>lua require('package-info').install()<cr>",
	{ silent = true, noremap = true, desc = "Install package" }
)
set_keymap(
	"n",
	"<leader>cpc",
	"<cmd>lua require('package-info').change_version()<cr>",
	{ silent = true, noremap = true, desc = "Change package version" }
)
