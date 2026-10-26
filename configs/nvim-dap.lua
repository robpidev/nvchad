local dap = require "dap"
local dapui = require "dapui"
dapui.setup()

-- Abrir UI al iniciar la depuración
dap.listeners.after.event_initialized["dapui"] = function()
  dapui.open()
end

-- Cerrar UI al finalizar
dap.listeners.before.event_terminated["dapui"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui"] = function()
  dapui.close()
end

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
