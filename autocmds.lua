require "nvchad.autocmds"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = ""

    local dir = vim.fn.expand "%:p:h"
    if dir == "" or dir == "." then return end

    local latexmkrc = dir .. "/.latexmkrc"
    if vim.fn.empty(vim.fn.glob(latexmkrc)) == 1 then
      vim.schedule(function()
        local choice = vim.fn.confirm(
          "No .latexmkrc found. Create one?",
          "&Yes\n&No",
          1
        )
        if choice == 1 then
          local content = table.concat({
            "$pdf_mode = 1;",
            "$interaction = 'nonstopmode';",
            "$bibtex = 'biber';",
            "$out_dir = 'build';",
          }, "\n") .. "\n"
          local f = io.open(latexmkrc, "w")
          if f then
            f:write(content)
            f:close()
            vim.notify("Created .latexmkrc", vim.log.levels.INFO)
          end
        end
      end)
    end
  end,
})
