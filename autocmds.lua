require "nvchad.autocmds"

-- En tu configuración o en un autocmd para tex
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.conceallevel = 2  -- 0=mostrar todo, 1=parcial, 2=ocultar más
    vim.opt_local.concealcursor = ""  -- No ocultar en la línea actual
  end,
})
