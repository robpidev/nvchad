return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    -- === Dap ===
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },
    { "<leader>dO", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", desc = "Toggle Repl" },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", desc = "Run Last" },
    { "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>", desc = "Terminate" },

    -- === dapui ===
    { "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle UI" },
    { "<leader>de", "<cmd>lua require'dapui'.eval()<CR>", desc = "Evaluate" },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    dapui.setup()

    -- Open UI when a session starts, close it when it ends
    dap.listeners.after.event_initialized["dapui"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui"] = function()
      dapui.close()
    end

    -- Highlights
    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#f5a623" })
    vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e3b2e" })

    -- Signs
    for name, text in pairs {
      DapBreakpoint = "●",
      DapBreakpointCondition = "◆",
      DapBreakpointRejected = "○",
      DapLogPoint = "◇",
      DapStopped = "▶",
    } do
      vim.fn.sign_define(name, {
        text = text,
        texthl = name,
        numhl = name,
        linehl = name == "DapStopped" and "DapStoppedLine" or "",
      })
    end
  end,
}
