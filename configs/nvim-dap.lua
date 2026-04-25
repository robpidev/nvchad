local dap = require "dap"

vim.fn.sign_define("DapBreakpoint", {
  text = "", -- icono del breakpoint normal
  texthl = "DapBreakpoint",
  linehl = "",
  numhl = "DapBreakpoint",
})

vim.fn.sign_define("DapBreakpointCondition", {
  text = "", -- breakpoint condicional
  texthl = "DapBreakpointCondition",
  linehl = "",
  numhl = "DapBreakpointCondition",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "", -- breakpoint rechazado por el adaptador
  texthl = "DapBreakpointRejected",
  linehl = "",
  numhl = "DapBreakpointRejected",
})

vim.fn.sign_define("DapLogPoint", {
  text = "", -- logpoint (no detiene, solo loguea)
  texthl = "DapLogPoint",
  linehl = "",
  numhl = "DapLogPoint",
})

vim.fn.sign_define("DapStopped", {
  text = "", -- línea donde está parado el debugger
  texthl = "DapStopped",
  linehl = "DapStoppedLine",
  numhl = "DapStopped",
})

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode", -- adjust as needed, must be absolute path
  name = "lldb",
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    -- program = "${file}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},

    -- ... the previous config goes here ...,
    initCommands = function()
      -- Find out where to look for the pretty printer Python module
      local rustc_sysroot = vim.fn.trim(vim.fn.system "rustc --print sysroot")

      local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
      local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

      local commands = {}
      local file = io.open(commands_file, "r")
      if file then
        for line in file:lines() do
          table.insert(commands, line)
        end
        file:close()
      end
      table.insert(commands, 1, script_import)

      return commands
    end,
    -- ...,
  },
}
