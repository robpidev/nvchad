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
vim.opt.shell = "pwsh"
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

-- Manim

--- manim LastN
vim.api.nvim_create_user_command("Manim", function(opts)
  local how_many = tonumber(opts.args)
  if not how_many then
    how_many = 3
  end -- valor por defecto

  local file = vim.fn.expand "%:p"
  local scene = ""

  local lines = vim.fn.readfile(file)
  local total = 0
  for _, line in ipairs(lines) do
    if line:match "self%.play%s*%(" or line:match "self%.wait%s*%(" then
      total = total + 1
    end
  end

  if total == 0 then
    vim.notify("No se encontraron animaciones.", vim.log.levels.WARN)
    return
  end

  local from = math.max(0, total - how_many)
  local cmd = {
    "manim",
    "-pql",
    file,
    scene,
    "--from_animation_number",
    tostring(from),
    vim.api.nvim_replace_termcodes("<CR>", true, false, true),
  }

  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
  vim.api.nvim_feedkeys(table.concat(cmd, " "), "n", true)
  vim.cmd "startinsert"
end, {
  nargs = "?",
})
