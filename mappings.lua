require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Save and exit
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save", silent = false })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "quit" })
map("n", "<leader>qq", "<cmd>qall!<CR>", { desc = "quit" })

-- Dap
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Continue" })
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step Into" })
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step Over" })
map("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step Out" })
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", { desc = "Toggle Repl" })
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Run Last" })
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle UI" })
map("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Terminate" })

-- dapui
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle UI" })
map("n", "<leader>de", "<cmd>lua require'dapui'.eval()<CR>", { desc = "Evaluate" })

-- color picker
map("n", "<leader>pc", "<cmd>:CccPick<CR>", { desc = "Color Picker" })
map("i", "<C-c>", "<ESC>:CccPick<CR>", { desc = "Color Picker" })

-- Ejecute last command in the terminal
map({ "n", "i", "t" }, "<A-;>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<UP><CR>", true, false, true), "n", true)
end, { desc = "terminal" })

-- Last command editor
map({ "n", "i", "t" }, "<A-.>", "<ESC>:<Up><CR>", { desc = "Last command editor" })

-- Codeium
map("i", "<A-]>", "<cmd>call codeium#CycleCompletions(1)<CR>", {
  desc = "Codeium next completion",
})

map("i", "<A-[>", "<cmd>call codeium#CycleCompletions(-1)<CR>", {
  desc = "Codeium previous completion",
})

map("i", "<A-Enter>", function()
  return vim.fn["codeium#Accept"]()
end, { desc = "Codeium accpet", expr = true })
