local keymap = vim.api.nvim_set_keymap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>y", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>u", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>i", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>o", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>Y", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>U", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>I", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>O", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
