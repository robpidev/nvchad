require "nvchad.mappings"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Save and exit
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save", silent = true })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "quit" })
map("n", "<leader>qq", "<cmd>qall!<CR>", { desc = "quit" })

-- === color picker ===
map("n", "<leader>pc", "<cmd>Huefy<CR>", { desc = "Color Picker" })
map("i", "<C-c>", "<cmd>Huefy<CR>", { desc = "Huefy color picker" })

-- === Ejecute last command in the terminal ===
map({ "n", "i", "t" }, "<A-;>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<UP><CR>", true, false, true), "n", true)
end, { desc = "terminal" })

-- === Last command editor ===
map({ "n", "i", "t" }, "<A-.>", "<ESC>:<Up><CR>", { desc = "Last command editor" })

-- === NeoTree ===
map({ "n", "i", "t" }, "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "NeoTree", silent = true })
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "NeoTree", silent = true })
