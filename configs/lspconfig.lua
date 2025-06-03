require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "pyright",
  "svelte",
  "ts_ls",
  "cssls",
  "rust_analyzer",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        -- extraPaths = { "./" },
        autoImportCompletions = true,
        autoSearchPaths = true,
        -- diagnosticMode = "workspace",
      },
    },
  },
})
