require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

vim.cmd [[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter  * if &nu | set nornu | endif
  autocmd BufWritePre * lua vim.lsp.buf.format()
augroup END
]]

-- Configurar PowerShell como la shell predeterminada
-- vim.opt.shell = "pwsh"
-- vim.opt.shellcmdflag = "-Command"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""

vim.cmd [[
set nowrap
]]

-- Cargar configuraciones específicas del proyecto si existen
vim.lsp.inlay_hint.enable(true)

-- Cmdline only shows in cmd
vim.o.cmdheight = 0

-- snipts
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"
